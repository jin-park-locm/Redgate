SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_BusListing]

@lAdvertiserID int

AS
SET NOCOUNT ON

SELECT	szTitle,
		szStreetName,
		szCity,
		sState,
		sPostalCode,
		szPhone,
		szFax,
		szPhoneAlt,
		szEmail,
		szURL
FROM	tblLP_BusListing bl
LEFT OUTER JOIN tblLP_BusDescription bd
ON		bd.lAdvertiserid = bl.lAdvertiserid	
WHERE   bl.lAdvertiserid=@lAdvertiserID

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing] TO [web_user]
GO
