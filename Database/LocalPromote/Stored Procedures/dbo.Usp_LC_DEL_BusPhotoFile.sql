SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusPhotoFile]     @lPhotoFileID  int    ASBEGINSET NOCOUNT ON    DELETE FROM [dbo].[tblLP_BusPhotoFile]    WHERE [lPhotoFileID] = @lPhotoFileIDIF @@ERROR <> 0SELECT @lPhotoFileID as lPhotoFileID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFile] TO [web_user]
GO
