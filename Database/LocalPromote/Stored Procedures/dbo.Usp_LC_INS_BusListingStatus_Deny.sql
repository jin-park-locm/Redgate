SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusListingStatus_Deny]
			SET 
				sLastStatus = 'N', 
				dtStatus = Getdate()
	WHERE	lAdvertiserID	= @lAdvertiserId 
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [web_user]
GO