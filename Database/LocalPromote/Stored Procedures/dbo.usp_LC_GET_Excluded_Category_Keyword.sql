SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Excluded_Category_Keyword]     @lAdvertiserID		int			      ,@BDC				int			      AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSET NOCOUNT ONSELECT	szKeywordFROM	[dbo].[tblLP_KeywordExcluded]WHERE	lAdvertiserID = @lAdvertiserIDAND		BDC			= @BDC
and		sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Excluded_Category_Keyword] TO [web_user]
GO
