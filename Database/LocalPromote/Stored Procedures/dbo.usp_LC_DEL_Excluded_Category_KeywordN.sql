SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Excluded_Category_KeywordN]     @lAdvertiserID		int			      ,@BDC				int			      ASSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSET NOCOUNT ONDECLARE @lExcludedID intSELECT	@lExcludedID = lExcludedIDFROM	[dbo].[tblLP_KeywordExcluded]WHERE	lAdvertiserID = @lAdvertiserIDAND		BDC			= @BDCBEGIN--    DELETE FROM [dbo].[tblLP_KeywordExcluded]--    WHERE lAdvertiserID = @lAdvertiserID--	AND   BDC			= @BDC	update [dbo].[tblLP_KeywordExcluded]	set sActive = 'N'		,dtUpdate = getdate()	from [dbo].[tblLP_KeywordExcluded]	WHERE lAdvertiserID = @lAdvertiserID	AND   BDC			= @BDCENDIF @@ERROR = 0 SELECT @lExcludedID AS lExcludedID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Excluded_Category_KeywordN] TO [web_user]
GO
