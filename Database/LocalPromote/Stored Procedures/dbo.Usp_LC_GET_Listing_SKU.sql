SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Listing_SKU]
@lAdvertiserID	int,
@lSiteID		int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT DISTINCT  szCID
FROM tblLP_ProductCampaign c
JOIN tblLP_ProductList     l  ON l.lProductID = c.lProductID
JOIN tblLP_ProductLevel    v  ON V.lLevel     = l.lLevel
JOIN tblLP_PartnerListing  g  ON g.lSiteID    = c.lSiteID
WHERE g.lAdvertiserID = @lAdvertiserID
AND   c.lSiteID		  = @lSiteID
AND   v.lLevel = 3
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Listing_SKU] TO [web_user]
GO
