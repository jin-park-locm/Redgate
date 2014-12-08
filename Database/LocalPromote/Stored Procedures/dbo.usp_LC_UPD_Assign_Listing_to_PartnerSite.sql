SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite]
	  @lAdvertiserID  	    int
	, @lSiteID			    int
	, @old_lSiteID			int
	--, @sListingType		char(3)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN

	UPDATE tblLP_PartnerListing
	SET --sActive = 'N', 
		--dtActiveN = getdate(),
		lSiteID = @lSiteID
	FROM tblLP_PartnerListing
	WHERE lAdvertiserID = @lAdvertiserId 	AND lSiteID = @old_lSiteID
	AND sListingType = 'FRE'


IF @@ERROR = 0
SELECT	@lSiteID as lSiteID,
		@lAdvertiserID as lAdvertiserID
	

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Assign_Listing_to_PartnerSite] TO [web_user]
GO
