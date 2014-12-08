SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/**********************************************************************************
Description   :   to retireve the active orders belong to a specific site

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-08-08   dlabrie    Initial Development

EXAMPLES: 

**********************************************************************************/

Create View [dbo].[vwLP_KeywordBDC3_old2]
AS

SELECT DISTINCT 
		ListingStoreMaster.dbo.glb_tbl_KeywordDNA.Keyword, 
		ListingStoreMaster.dbo.glb_tbl_KeywordDNA.Tier3BDC AS DefaultTier3, 
        CASE	WHEN dbo.glb_tbl_BDC.displayTitle IS NULL 
				THEN Title 
				ELSE DisplayTitle 
				END AS CategoryDesc
FROM	ListingStoreMaster.dbo.glb_tbl_KeywordDNA 
INNER JOIN
		dbo.glb_tbl_BDC ON ListingStoreMaster.dbo.glb_tbl_KeywordDNA.Tier3BDC = dbo.glb_tbl_BDC.DisplayBDC
WHERE     (SUBSTRING(CAST(ListingStoreMaster.dbo.glb_tbl_KeywordDNA.DefaultTier3 AS Varchar(10)), 7, 2) = '00')
GO
GRANT SELECT ON  [dbo].[vwLP_KeywordBDC3_old2] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[vwLP_KeywordBDC3_old2] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[vwLP_KeywordBDC3_old2] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[vwLP_KeywordBDC3_old2] TO [lcssui]
GRANT SELECT ON  [dbo].[vwLP_KeywordBDC3_old2] TO [web_user]
GO
