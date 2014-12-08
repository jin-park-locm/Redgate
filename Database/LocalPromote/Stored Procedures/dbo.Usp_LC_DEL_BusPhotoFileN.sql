SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusPhotoFileN]     @lPhotoFileID  int    ASBEGINSET NOCOUNT ON	UPDATE	[dbo].[tblLP_BusPhotoFile]	SET		sActive = 'N',			dtUpdate = getdate()	WHERE [lPhotoFileID] = @lPhotoFileIDIF @@ERROR <> 0SELECT @lPhotoFileID as lPhotoFileID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPhotoFileN] TO [web_user]
GO
