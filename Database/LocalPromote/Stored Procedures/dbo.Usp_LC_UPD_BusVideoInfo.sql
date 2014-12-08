SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE    PROCEDURE [dbo].[Usp_LC_UPD_BusVideoInfo]
		,[szUpdatedBy]				= ISNULL(@szUpdatedBy, [szUpdatedBy])
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoInfo] TO [web_user]
GO