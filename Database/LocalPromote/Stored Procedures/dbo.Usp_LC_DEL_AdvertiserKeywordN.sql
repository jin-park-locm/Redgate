SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_AdvertiserKeywordN]
	 @lKeywordiD	int
 
    
AS
SET NOCOUNT ON


BEGIN

	UPDATE	[dbo].[tblLP_AdvertiserKeyword]
	Set		sActive = 'N',
			dtUpdate = getdate()
	WHERE	lKeywordiD = @lKeywordiD
    
IF @@ERROR <> 0
SELECT @lKeywordiD AS lKeywordiD
 

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeywordN] TO [web_user]
GO
