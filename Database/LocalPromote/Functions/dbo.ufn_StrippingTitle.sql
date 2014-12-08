SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE    function [dbo].[ufn_StrippingTitle]
(
	@Input varchar(256)
)
returns varchar(256)
as
begin

declare @len smallint
declare @Letter char(1)
declare @Position smallint

set @Input = replace(@Input, '|', '')
set @len = len(@Input)
set @Position = 1
while @Position <= @len
begin
	set @Letter = substring(@Input, @Position, 1)
	
	if exists (select @Letter where @Letter in ('!', '"', '#', '$', '%', '''', '(', ')', '*', '+', ',',
												'.', ':', ';', '<', '=', '>', '?', '@', '[', '\',
												']', '^', '`', '{', '}', '~', '')
				)
		set @input = substring (@input, 1, @Position-1) + '|' + substring (@input, @Position + 1, @len - @Position)
	else
		if exists (select @Letter where @Letter in ('_', '-', '/', '&'))
			set @input = substring (@input, 1, @Position-1) + ' ' + substring (@input, @Position + 1, @len - @Position)

	set @Position = @Position  + 1
end
set @Input = ltrim(rtrim(replace(@Input, '|', '')))
return replace(replace(replace(replace(replace(replace(@Input, ' and ', ' '), SPACE(4), ' ' ), SPACE(2), ' '), SPACE(2), ' ') + ' ', SPACE(2), ' '), ' ', '|')    
end

GO
