SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingStatus] 
@lAdvertiserID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN	 

	SELECT	DISTINCT 
			s.sStatus, 
			t.szStatusDesc
	From tblLP_BusListingStatus	s  
	JOIN tblAL_StatusType	    t ON t.sStatus = s.sStatus
 
	WHERE s.lAdvertiserID = @lAdvertiserID AND
		  s.sLastStatus   = 'Y'	AND
		  t.sActive       = 'Y'
		 

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStatus] TO [web_user]
GO
