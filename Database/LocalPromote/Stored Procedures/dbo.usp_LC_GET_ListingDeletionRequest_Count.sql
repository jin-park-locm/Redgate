SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingDeletionRequest_Count]
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE @deletionRequestCount int

SELECT @deletionRequestCount = COUNT(*)
FROM tblCC_acxListing
WHERE sAction = 'DEL'
AND   sConfirm = 'N'

IF @@ERROR = 0
SELECT @deletionRequestCount AS deletionRequestCount
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeletionRequest_Count] TO [web_user]
GO
