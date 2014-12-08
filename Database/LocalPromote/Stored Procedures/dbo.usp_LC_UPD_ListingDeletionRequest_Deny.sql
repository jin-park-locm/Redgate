SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny]
@lCCListingID int
AS
SET NOCOUNT ON

BEGIN

--	UPDATE [tblCC_acxListing]
--	SET [sConfirm] = 'R'
--       ,[sUpdate] = getdate()
--	WHERE lCCListingID = @lCCListingID
--	AND [sConfirm] = 'N'


	UPDATE  a	SET a.[sConfirm] = 'R'      	FROM   [tblCC_acxListing] a	WHERE a.[sAction] = 'DEL'	AND a.[sConfirm]	= 'N'	AND (		a.RID IN ( SELECT RID FROM [tblCC_acxListing] 					WHERE lCCListingID = @lCCListingID)	    OR		a.lAdvertiserID IN ( SELECT lAdvertiserID FROM [tblCC_acxListing] 					WHERE lCCListingID = @lCCListingID)			)END 				
				

IF @@ERROR = 0
SELECT @lCCListingID AS lCCListingID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingDeletionRequest_Deny] TO [web_user]
GO
