SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create function [dbo].[glb_fn_NormalizeKeyword]
(
	@Input varchar(256)
	, @RemoveWhiteSpace bit = 1
)

returns varchar(256)

as

begin

declare @Token varchar(40), @NewToken varchar(32)
declare @NewTitle varchar(256)

set @Input = dbo.glb_fn_StemWords( @Input )
set @NewTitle = ''

declare Tokens cursor local for
	select vcWord from dbo.glb_fn_WordTable2( @Input )

open Tokens

fetch next from Tokens into @Token

while @@fetch_status = 0
begin
	if exists ( select SearchToken from glb_tbl_KeywordReplacement where SearchToken = @Token )
	begin	
		select @NewToken = ReplaceWith from glb_tbl_KeywordReplacement where SearchToken = @Token

		if @NewToken is not null
			set @NewTitle = @NewTitle + ' ' + upper( left( @NewToken, 1 ) ) + right( @NewToken, len( @NewToken ) - 1 )
	end
	else
		set @NewTitle = @NewTitle + ' ' + upper( left( @Token, 1 ) ) + right( @Token, len( @Token ) - 1 )

	fetch next from Tokens into @Token
end

close Tokens
deallocate Tokens

if @RemoveWhiteSpace = 1
	return replace( replace( @NewTitle, ' ', '' ), '-', '' )

return ltrim( rtrim( @NewTitle ) )

end
GO
