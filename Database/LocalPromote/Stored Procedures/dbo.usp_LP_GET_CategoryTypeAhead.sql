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

CREATE  procedure [dbo].[usp_LP_GET_CategoryTypeAhead]

@Keyword		varchar(100)

AS 
	
BEGIN

declare @shortKeyword varchar(3)

if		len(@Keyword) > 3
		set @shortKeyword = LEFT(@Keyword, 3)
else	
		set @shortKeyword = @Keyword

select	top 50 *
from	
		(
		SELECT  DISTINCT ISNULL(a.DisplayTitle, a.Title) as Title, 
				a.DisplayBDC as BDC
		FROM	glb_tbl_BDC a, 
				ListingStoreMaster..glb_tbl_KeywordDNA b
		WHERE	b.keyword LIKE @Keyword + '%' 
		-- ((a.DisplayTitle LIKE LEFT(@Keyword, 3) + '%') or (a.Title LIKE LEFT(@Keyword, 3) + '%')) 
		--		b.keyword =  @Keyword 
		and		b.BDC=a.displayBDC	
		and		a.sActive = 'Y'	
		) x
where	Title like @shortKeyword + '%'

union all

select	top 50 *
from	
		(
		SELECT  DISTINCT
				ISNULL(a.DisplayTitle, a.Title) as Title, 
				a.DisplayBDC as BDC
		FROM	glb_tbl_BDC a, 
				ListingStoreMaster..glb_tbl_KeywordDNA b
		WHERE	-- b.keyword LIKE  @Keyword + '%' 
		b.keyword =  @Keyword 
		and		b.BDC=a.displayBDC
		and		a.sActive = 'Y'
		) y
where	Title not like LEFT(@Keyword, 3) + '%'


END		

GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoryTypeAhead] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoryTypeAhead] TO [web_user]
GO
