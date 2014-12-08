SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*****************************************************************************
File Name     :   usp_LP_GET_CategoryTypeAhead_LeadGen.sql
Description   :   Get Category Type ahead on SSUI
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-06-2013 DRS      Initial Development

<example>
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'rental'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'car'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'carton'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'floor'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'pizz'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'pizza'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'flow'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'flower'
exec usp_LP_GET_CategoryTypeAhead_LeadGen 'Veterinarian'
</example>
*****************************************************************************/

CREATE procedure [dbo].[usp_LP_GET_CategoryTypeAhead_LeadGen]

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
		and		a.displayBDC %10000 > 0
		and		a.iTier in (3,4)
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
		and		a.displayBDC %10000 > 0
		and		a.iTier in (3,4)
		) y
where	Title not like LEFT(@Keyword, 3) + '%'


END
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoryTypeAhead_LeadGen] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoryTypeAhead_LeadGen] TO [web_user]
GO
