SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE    function [dbo].[glb_fn_NormalizeListingTitle]
(
	@Input varchar(256)
)
returns varchar(256)
as
begin
declare @Token varchar(40), @NewToken varchar(32)
declare @NewTitle varchar(256)
set @Input = dbo.glb_fn_StemWords( @Input )
set @NewTitle = ''
if exists (
	select SearchToken
	from dbo.glb_fn_WordTable2( @Input ) w, glb_tbl_ListingTitleReplacement l
	where w.vcWord = l.SearchToken
)
begin
	declare Tokens cursor local for
		select vcWord from dbo.glb_fn_WordTable2( @Input )
	
	open Tokens
	
	fetch next from Tokens into @Token
	
	while @@fetch_status = 0
	begin
		if exists ( select SearchToken from glb_tbl_ListingTitleReplacement where SearchToken = @Token )
		begin	
			select @NewToken = ReplaceWith from glb_tbl_ListingTitleReplacement where SearchToken = @Token
			if @NewToken is not null
				set @NewTitle = @NewTitle + ' ' + @NewToken
		end
		else
			set @NewTitle = @NewTitle + ' ' + @Token
	
		fetch next from Tokens into @Token
	end
	
	close Tokens
	deallocate Tokens
	-- return replace( replace( @NewTitle, ' ', '' ), '-', '' )
	return  replace(replace(replace(replace(replace(rtrim(ltrim(replace(@NewTitle, '-', ''))), SPACE(4), ' ' ), SPACE(2), ' '), SPACE(2), ' ') + ' ', SPACE(2), ' '), ' ', '|') 
end
-- return replace( replace( @Input, ' ', '' ), '-', '' )
return replace(replace(replace(replace(replace(rtrim(ltrim(replace(@Input, '-', ''))), SPACE(4), ' ' ), SPACE(2), ' '), SPACE(2), ' ') + ' ', SPACE(2), ' '), ' ', '|')  

end

GO
GRANT EXECUTE ON  [dbo].[glb_fn_NormalizeListingTitle] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[glb_fn_NormalizeListingTitle] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[glb_fn_NormalizeListingTitle] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[glb_fn_NormalizeListingTitle] TO [web_user]
GO
