SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Delete_Listing_Per_Request]
@lCCListingID int
AS
SET NOCOUNT ON

SELECT @lCCListingID AS lCCListingID

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Delete_Listing_Per_Request] TO [web_user]
GO