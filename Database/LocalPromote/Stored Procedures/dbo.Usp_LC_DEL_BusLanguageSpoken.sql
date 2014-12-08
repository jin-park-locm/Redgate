SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusLanguageSpoken]     @lAdvertiserID  int    ASBEGIN    DELETE FROM [dbo].[tblLP_BusLanguageSpoken]    WHERE [lAdvertiserID] = @lAdvertiserIDIF @@ERROR <> 0SELECT @lAdvertiserID as lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpoken] TO [web_user]
GO
