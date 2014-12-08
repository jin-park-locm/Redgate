SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Category_KeywordN]     @lAdvertiserID  int    ASSET NOCOUNT ON
BEGIN--    DELETE FROM [dbo].[tblLP_KeywordExcluded]--    WHERE lAdvertiserID = @lAdvertiserID	update [dbo].[tblLP_KeywordExcluded]	set sActive = 'N'		,dtUpdate = getdate()	from [dbo].[tblLP_KeywordExcluded]    WHERE lAdvertiserID = @lAdvertiserIDENDIF @@ERROR = 0SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_KeywordN] TO [web_user]
GO
