SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  function [dbo].[glb_fn_StemWords]
(
	@input varchar(256)
)
returns varchar(256)
as
begin
	if @input is null
		return null
	declare @token varchar(256)
	declare @stemmedNoun varchar(256)
	declare @stemmedResult varchar(256)
-- The first step is to tokenize the input string using the WordTable2 function.
	declare tokens cursor for
		select
			vcWord
		from
			dbo.glb_fn_WordTable2( @input )
	set @stemmedResult = ''
-- Once the input string has been tokenized, we try to stem each of the tokens.
	open tokens
	fetch next from tokens into @token
	while @@fetch_status = 0
	begin
-- These two clauses handle apostrophes.  In the case of an "s" followed by an apostrophe, 
-- the apostrophe is eliminated.  In the case of an apostrophe followed by an "s", both 
-- the "s" and the apostrophe are eliminated.
		if right( @token, 2 ) = 's'''
			set @token = left( @token, len( @token ) - 1 )
		else if right( @token, 2 ) = '''s'
			set @token = left( @token, len( @token ) - 2 )
-- The next step is to check whether the token appears in the WordNet noun exclusion list 
-- (a list of all irregular noun plurals).  If it does appear, then the plural is replaced 
-- with the corresponding singular form.
		set @stemmedNoun = null
		select
			@stemmedNoun = StemmedNoun
		from
			glb_tbl_NounStemExclusion (nolock)
		where
			Noun = @token
		if @stemmedNoun is not null
			set @stemmedResult = @stemmedResult + ' ' + @stemmedNoun
-- If the token does not appear in the WordNet noun exclusion list, then we check to see 
-- if the token can be formed from one of the rules for regular plurals.  If it can and 
-- if the result of applying the rule is a singular form in the WordNet noun database, 
-- then the token is replaced with the singular form. 
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
-- If the token is not in the exclusion list and if it is not a regular plural form, 
-- then we leave it as it is.
				else
					set @stemmedResult = @stemmedResult + ' ' + @token
			end
		end
		fetch next from tokens into @token
	end
	close tokens
	deallocate tokens
	return ltrim( rtrim( @stemmedResult ) )
end

GO
GRANT EXECUTE ON  [dbo].[glb_fn_StemWords] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[glb_fn_StemWords] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[glb_fn_StemWords] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[glb_fn_StemWords] TO [web_user]
GO
