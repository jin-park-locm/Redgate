SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Delete_Listing_Per_Request]
@lCCListingID int
AS
SET NOCOUNT ON
BEGIN----   UPDATE [dbo].[tblCC_acxListing]--   SET [sConfirm] = 'Y'        --   WHERE lCCListingID = @lCCListingID--	AND[sAction] = 'DEL'--	AND [sConfirm]	= 'N'	UPDATE  a	SET a.[sConfirm] = 'Y'      	FROM   [tblCC_acxListing] a	WHERE a.[sAction] = 'DEL'	AND a.[sConfirm]	= 'N'	AND (		a.RID IN ( SELECT RID FROM [tblCC_acxListing] 					WHERE lCCListingID = @lCCListingID)	    OR		a.lAdvertiserID IN ( SELECT lAdvertiserID FROM [tblCC_acxListing] 					WHERE lCCListingID = @lCCListingID)			)							IF @@ERROR = 0
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
