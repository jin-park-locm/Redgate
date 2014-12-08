SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/**********************************************************************************
Description   :   Scripted from existing function in TrackDB..glb_fn_CapitalizeString

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-08-2008 bwu      Initial check in

declare @Title as varchar(255)
select @Title = dbo.glb_fn_CapitalizeString('bike shop')
print @Title
**********************************************************************************/

CREATE           function [dbo].[glb_fn_CapitalizeString]
(
	@Input varchar(1024)
)
returns varchar(1024)
as
begin
	declare @SplitIndex smallint
	declare @FirstWord varchar(1024)
	set @Input = ltrim( rtrim( @Input)) -- by Jinn 4/26/2005
	if len( @Input ) > 0
	begin
		set @SplitIndex = charIndex( ' ', @Input )

		if charIndex( '-', @Input ) < @SplitIndex and charIndex( '-', @Input ) <> 0 or @SplitIndex = 0
			set @SplitIndex = charIndex( '-', @Input )
	
		if @SplitIndex = 0
		begin
			if (select count(*) where @input in (select Capword from dbo.tblAL_CapWord where sActive='Y'))>0
                        --if @Input = 'LLC' or @Input = 'II' or @Input = 'III' or @Input = 'PC' or @Input = 'DDS' or @Input = 'DMD' or @Input = 'MD' or @Input = 'CPA' or @Input = 'BMW' or @Input='IBM' or @Input='GMC' or @Input='GMAC'
				return upper(@Input)

			if @Input='MacDougal' or @Input='McDonald''s' or  @Input='McDonald'
				return @Input

			if Left(@Input,3)='aaa' or Left(@Input,2)='o'''
				return upper( left( @Input, 3 ) ) + lower( substring( @Input, 4, len( @Input ) - 3 ) )

			if Left(@Input,1)='#' and len(@Input)>=2
				return upper( left( @Input, 2 ) ) + lower( substring( @Input, 3, len( @Input ) - 2 ) )
	
			return upper( left( @Input, 1 ) ) + lower( substring( @Input, 2, len( @Input ) - 1 ) )
		end
		else if @SplitIndex = 1
			return substring( @Input, @SplitIndex, 1 ) + dbo.glb_fn_CapitalizeString( right( @Input, len( @Input ) - @SplitIndex ) )
		else
		begin
			set @FirstWord = substring( @Input, 1, @SplitIndex - 1 )
			
			if (select count(*) where @FirstWord in (select Capword from dbo.tblAL_CapWord where sActive='Y'))>0
			--if @FirstWord = 'LLC' or @FirstWord = 'II' or @FirstWord = 'III' or @FirstWord = 'PC' or @FirstWord = 'DDS' or @FirstWord = 'DMD' or @FirstWord = 'MD' or @FirstWord = 'CPA' or @FirstWord = 'BMW' or @FirstWord='IBM' or @FirstWord='GMC' or @FirstWord='GMAC'
				return upper(@FirstWord) + substring( @Input, @SplitIndex, 1 ) + dbo.glb_fn_CapitalizeString( right( @Input, len( @Input ) - @SplitIndex ) )

			if @FirstWord='MacDougal' or @FirstWord='McDonald''s' or  @FirstWord='McDonald'
				return @FirstWord + substring( @Input, @SplitIndex, 1 ) + dbo.glb_fn_CapitalizeString( right( @Input, len( @Input ) - @SplitIndex ))

			else if Left(@FirstWord,3)='aaa' or Left(@FirstWord,2)='o'''  
				return upper( left( @FirstWord, 3 ) ) + lower( substring( @FirstWord, 4, @SplitIndex - 4 ) ) + substring( @Input, @SplitIndex, 1 ) + dbo.glb_fn_CapitalizeString( right( @Input, len( @Input ) - @SplitIndex ) )

			else if Left(@FirstWord,1)='#' and len(@FirstWord)>=2
				return upper( left( @FirstWord, 2 ) ) + lower( substring( @FirstWord, 3, @SplitIndex - 3 ) ) + substring( @Input, @SplitIndex, 1 ) + dbo.glb_fn_CapitalizeString( right( @Input, len( @Input ) - @SplitIndex ) )

			else
				return upper( left( @Input, 1 ) ) + lower( substring( @Input, 2, @SplitIndex - 2 ) ) + substring( @Input, @SplitIndex, 1 ) + dbo.glb_fn_CapitalizeString( right( @Input, len( @Input ) - @SplitIndex ) )
		end
	end
	
	return ''
end


















GO
