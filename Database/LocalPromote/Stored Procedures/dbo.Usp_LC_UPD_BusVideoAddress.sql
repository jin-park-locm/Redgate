SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BusVideoAddress]
IF @@ERROR = 0
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [web_user]
GO