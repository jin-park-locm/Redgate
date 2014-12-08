SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingStatus] 
  @lAdvertiserID int
, @sStatus char(3)
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN	 

	UPDATE s
		SET 
			s.sStatus = @sStatus
	From tblLP_BusListingStatus	s   
 
	WHERE s.lAdvertiserID = @lAdvertiserID  

IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID
 
		 

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStatus] TO [web_user]
GO
