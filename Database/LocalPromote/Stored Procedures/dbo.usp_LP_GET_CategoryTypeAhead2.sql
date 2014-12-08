SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*****************************************************************************
File Name     :   usp_LP_GET_CategoryTypeAhead.sql
Description   :   Get Category Type ahead on SSUI
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
03-05-2010 dlabrie   Initial Development
03-05-2010 bwu		 Added like and not like

<example>
exec usp_LP_GET_CategoryTypeAhead 'rental'
exec usp_LP_GET_CategoryTypeAhead 'car'
exec usp_LP_GET_CategoryTypeAhead 'carton'
exec usp_LP_GET_CategoryTypeAhead 'floor'
exec usp_LP_GET_CategoryTypeAhead 'pizz'
exec usp_LP_GET_CategoryTypeAhead 'pizza'
exec usp_LP_GET_CategoryTypeAhead 'flow'
exec usp_LP_GET_CategoryTypeAhead 'flower'
exec usp_LP_GET_CategoryTypeAhead 'Veterinarian'
</example>
*****************************************************************************/

CREATE  procedure [dbo].[usp_LP_GET_CategoryTypeAhead2]

@Keyword		varchar(100)

AS 
	
BEGIN

declare @shortKeyword varchar(3)

if		len(@Keyword) > 3
		set @shortKeyword = LEFT(@Keyword, 3)
else	
		set @shortKeyword = @Keyword

		SELECT  DISTINCT TOP 50 ISNULL(a.DisplayTitle, a.Title) as Title, 
				a.DisplayBDC as BDC
		FROM	glb_tbl_BDC a (nolock), 
				ListingStoreMaster..glb_tbl_KeywordDNA b (nolock)
		WHERE	b.keyword LIKE @Keyword + '%' 
		-- ((a.DisplayTitle LIKE LEFT(@Keyword, 3) + '%') or (a.Title LIKE LEFT(@Keyword, 3) + '%')) 
		--		b.keyword =  @Keyword 
		and		b.BDC=a.displayBDC	
		and		a.sActive = 'Y'	
		and		Title like @shortKeyword + '%'

union

		SELECT  DISTINCT TOP 50
				ISNULL(a.DisplayTitle, a.Title) as Title, 
				a.DisplayBDC as BDC
		FROM	glb_tbl_BDC a (nolock), 
				ListingStoreMaster..glb_tbl_KeywordDNA b (nolock)
		WHERE	-- b.keyword LIKE  @Keyword + '%' 
		b.keyword =  @Keyword 
		and		b.BDC=a.displayBDC
		and		a.sActive = 'Y'
		and		Title not like LEFT(@Keyword, 3) + '%'


END		

GO
