SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN]	@SiteID intASSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON
Update	iSet		Reason = 'DEL',		rLoad = 'P'	FROM	[ListingEnhance].[dbo].[tblTM_UploadLDACImport] iWHERE	i.SiteID = @SiteIDAND		i.Reason IS NOT NULL
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Listing_By_PartnerSiteIDN] TO [web_user]
GO
