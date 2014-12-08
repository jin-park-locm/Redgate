SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite]
	  @lAdvertiserID	int
	, @lSiteID			int
	, @sListingType		char(3)
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN

	UPDATE tblLP_PartnerListing
	SET sActive = 'N', dtActiveN = getdate()
	FROM tblLP_PartnerListing
	WHERE lAdvertiserID = @lAdvertiserId 
		AND (sListingType = 'FRE' OR @sListingType = 'LED')

	IF @@ERROR = 0
	  BEGIN
		INSERT INTO tblLP_PartnerListing
		(
				  lSiteID
				, lAdvertiserID
				, sListingType
				, sActive
				, szUpdatedBy
				, dtActiveY
				, dtActiveN
		)
		VALUES
		( 
				  @lSiteID
				, @lAdvertiserID
				, @sListingType
				, 'Y'
				, 'UI'
				, getDate()
				, NULL
		)

		IF @@ERROR = 0
		SELECT	@lSiteID as lSiteID,
				@lAdvertiserID as lAdvertiserID,
				@sListingType as sListingType
	  END

END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Assign_Listing_to_PartnerSite] TO [web_user]
GO
