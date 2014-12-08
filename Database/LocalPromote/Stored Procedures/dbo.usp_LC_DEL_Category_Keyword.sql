SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Category_Keyword]     @lAdvertiserID  int    ASSET NOCOUNT ON
BEGIN    DELETE FROM [dbo].[tblLP_KeywordExcluded]    WHERE lAdvertiserID = @lAdvertiserIDENDIF @@ERROR = 0SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_Keyword] TO [web_user]
GO
