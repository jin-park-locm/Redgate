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

*********************************************************************************
WHERE     (SUBSTRING(CAST(ListingStoreMaster.dbo.glb_tbl_KeywordDNA.DefaultTier3 AS Varchar(10)), 7, 2) = '00')*/
CREATE VIEW [dbo].[vwLP_KeywordBDC3_jin]
AS
SELECT DISTINCT 
                      ListingStoreMaster.dbo.glb_tbl_KeywordDNA.Keyword, ListingStoreMaster.dbo.glb_tbl_KeywordDNA.BDC AS DefaultTier3, 
                      CASE WHEN dbo.glb_tbl_BDC.displayTitle IS NULL THEN Title ELSE DisplayTitle END AS CategoryDesc
FROM         ListingStoreMaster.dbo.glb_tbl_KeywordDNA INNER JOIN
                      dbo.glb_tbl_BDC ON ListingStoreMaster.dbo.glb_tbl_KeywordDNA.BDC = isnull(dbo.glb_tbl_BDC.DisplayBDC, glb_tbl_BDC.BDC)
WHERE     (dbo.glb_tbl_BDC.sActive = 'Y')

GO
