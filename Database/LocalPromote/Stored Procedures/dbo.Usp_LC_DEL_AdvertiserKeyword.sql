SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_AdvertiserKeyword]
	 @lKeywordiD	int
 
    
AS
SET NOCOUNT ON


BEGIN

    DELETE FROM [dbo].[tblLP_AdvertiserKeyword]
	WHERE lKeywordiD = @lKeywordiD
    

IF @@ERROR <> 0
SELECT @lKeywordiD AS lKeywordiD
 

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdvertiserKeyword] TO [web_user]
GO
