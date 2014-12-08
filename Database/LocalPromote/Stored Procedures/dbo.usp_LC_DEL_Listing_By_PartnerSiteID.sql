SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID]@SiteID intASSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON
DELETE i	FROM	ListingEnhance.[dbo].[tblTM_UploadLDACImport] iWHERE	i.SiteID = @SiteIDAND		i.Reason IS NOT NULL
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteID] TO [web_user]
GO
