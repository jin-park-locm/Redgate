SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[usp_LC_UPD_BusListing_setPremium]
@lAdvertiserID		int,
@sAgencyID			char(2)			 = null

AS
SET NOCOUNT ON

-- PK lAdvertiserID
 
DECLARE @ERR int
 
UPDATE b
	SET	
		sAgencyID		=	ISNULL (@sAgencyID ,sAgencyID )

FROM tblLP_BusListing b
WHERE lAdvertiserID = @lAdvertiserID
 

IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing_setPremium] TO [web_user]
GO
