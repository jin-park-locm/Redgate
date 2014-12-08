SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[Usp_LC_GET_BusListingContent]

@lAdvertiserID		int 

AS

SET TRANSACTION ISOLATION LEVEL READ   UNCOMMITTED

SET NOCOUNT ON

SELECT 	
lAdvertiserID, 
szTagLine, 
szReturnPolicy, 
lLocationTotal, 
lEmployeeTotal, 
szYearEstablished, 
sFemale, 
sMinority, 
sEmergency, 
szAward, 
szCertification
FROM tblLP_BusListingContent
WHERE lAdvertiserID = @lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingContent] TO [web_user]
GO
