SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE  function [dbo].[glb_fn_StemSingleWord]
(
	@token varchar(256)
)
returns varchar(256)
as
begin

	if @token is null
		return null

	declare @len smallint
	set @len = 1
	while @len <= len (@token)
	begin
		if not exists (select asCode from glb_tbl_AlphaNumericASCII (nolock) 
			where asCode = ascii (substring (@token, @len, 1)))
			set @token = substring (@token, 1, @len-1) + ' ' + substring (@token, @len + 1, len (@token)-@len)
			set @len = @len  + 1
		end

	if right( @token, 2 ) = 's'''
		set @token = left( @token, len( @token ) - 1 )
	else if right( @token, 2 ) = '''s'
		set @token = left( @token, len( @token ) - 2 )

	declare @stemmedNoun varchar(256)
	declare @stemmedResult varchar(256)
	set @stemmedResult = ''
	set @stemmedNoun = null

	select	@stemmedNoun = StemmedNoun 
	from	glb_tbl_NounStemExclusion (nolock)
	where	Noun = @token
	
	if @stemmedNoun is not null
		set @stemmedResult = @stemmedResult + ' ' + @stemmedNoun
	else
		begin
			declare @suffix varchar(3)
			set @suffix =
				case right( @token, 3 )
					when 'ies' then 'y'
					when 'ses' then 's'
					when 'xes' then 'x'
					when 'zes' then 'z'
					when 'ies' then 'y'
					else null
				end
			if @suffix is not null and len( @token ) > 4 and exists ( select Noun from glb_v_Noun (nolock) where Noun = left( @token, len( @token ) - 3 ) + @suffix )
				set @stemmedResult = @stemmedResult + ' ' + left( @token, len( @token ) - 3 ) + @suffix
			else
			begin
				set @suffix =
					case right( @token, 4 )
						when 'ches' then 'ch'
						when 'shes' then 'sh'
						else null
					end
				if @suffix is not null and len( @token ) > 4 and exists ( select Noun from glb_v_Noun (nolock) where Noun = left( @token, len( @token ) - 4 ) + @suffix )
					set @stemmedResult = @stemmedResult + ' ' + left( @token, len( @token ) - 4 ) + @suffix
				else if right( @token, 3 ) = 'men' and exists ( select Noun from glb_v_Noun (nolock) where Noun = left( @token, len( @token ) - 3 ) + 'man' )
					set @stemmedResult = @stemmedResult + ' ' + left( @token, len( @token ) - 3 ) + 'man'
				else if right( @token, 1 ) = 's' and len( @token ) > 3 and exists ( select Noun from glb_v_Noun (nolock) where Noun = left( @token, len( @token ) - 1 ) )
					set @stemmedResult = @stemmedResult + ' ' + left( @token, len( @token ) - 1 )
				else
					set @stemmedResult = @stemmedResult + ' ' + @token
			end
		end

	declare @NewToken varchar(32)
	
	if exists ( select SearchToken from glb_tbl_KeywordReplacement (nolock) where SearchToken = ltrim(rtrim(@stemmedResult)) )
		begin	
			select @NewToken = ReplaceWith from glb_tbl_KeywordReplacement (nolock) where SearchToken = @stemmedResult
			set @stemmedResult = isnull(@NewToken, '')
		end

	set @stemmedResult = ltrim(rtrim(@stemmedResult))
	if len(@stemmedResult) > 1
		set @stemmedResult = upper(left(@stemmedResult, 1)) + right( @stemmedResult, len( @stemmedResult ) - 1 )
	else		
		if len(@stemmedResult) = 1
			set @stemmedResult = upper(@stemmedResult)

	return @stemmedResult
end

GO
