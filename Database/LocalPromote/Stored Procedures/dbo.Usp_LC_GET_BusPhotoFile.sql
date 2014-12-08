SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Usp_LC_GET_BusPhotoFile]
AND		sActive = 'Y'
ORDER BY lPhotoFileID ASC

GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusPhotoFile] TO [web_user]
GO