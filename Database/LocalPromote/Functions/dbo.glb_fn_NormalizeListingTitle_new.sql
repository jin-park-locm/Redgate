SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE    function [dbo].[glb_fn_NormalizeListingTitle_new]
(
	@Input varchar(256)
)
returns varchar(256)
as
/*
	select [dbo].[glb_fn_NormalizeListingTitle]('sams')
	select [dbo].[glb_fn_NormalizeListingTitle_new]('sams')
*/

begin

declare @Position smallint
declare @output varchar(256)
declare @token varchar(256)

set @Input = ltrim(rtrim(replace(@Input, '|', '')))
set @output = ''
set @Position = charindex(' ', @Input)

while @Position > 1
begin
	select @token = dbo.glb_fn_StemSingleWord(left(@input, @Position-1))

	if exists (select SearchToken from glb_tbl_ListingTitleReplacement (nolock) where SearchToken = @Token)
		select @Token = isnull(ReplaceWith, '') from glb_tbl_ListingTitleReplacement (nolock) where SearchToken = @Token
		
	set @token =	case @token when '' then @token
					else @token + ' '
					end

	set @output = @output + @token

	set @Input = ltrim(Right(@input, len(@input) - @Position))
	set @Position = charindex(' ', @Input)

end

select @token = dbo.glb_fn_StemSingleWord(@input)

if exists (select SearchToken from glb_tbl_ListingTitleReplacement (nolock) where SearchToken = @Token)
	select @Token = isnull(ReplaceWith, '') from glb_tbl_ListingTitleReplacement (nolock) where SearchToken = @Token

set @output = @output + @token

-- return replace( replace( @output, ' ', '' ), '-', '' )
return replace(replace(replace(replace(replace(rtrim(ltrim(replace(@output, '-', ''))), SPACE(4), ' ' ), SPACE(2), ' '), SPACE(2), ' ') + ' ', SPACE(2), ' '), ' ', '|')  

end

GO
