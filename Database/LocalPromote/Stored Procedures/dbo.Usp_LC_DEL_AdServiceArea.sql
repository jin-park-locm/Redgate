SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_AdServiceArea]     @lAdvertiserID  int    ASBEGIN    DELETE FROM [dbo].[tblLP_AdServiceArea]    WHERE lAdvertiserID = @lAdvertiserIDIF @@ERROR <> 0SELECT @lAdvertiserID AS lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceArea] TO [web_user]
GO
