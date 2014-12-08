SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusListingStatus]
SET NOCOUNT ON
	SET sLastStatus = 'N', dtStatus = getdate()
	WHERE lAdvertiserID = @lAdvertiserId 
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [web_user]
GO