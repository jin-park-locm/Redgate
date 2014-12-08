SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusBrandOffered]     @lAdvertiserID  int    ASSET NOCOUNT ON
BEGIN    DELETE FROM [dbo].[tblLP_BusBrandOffered]    WHERE lAdvertiserID = @lAdvertiserIDENDIF @@ERROR <> 0SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOffered] TO [web_user]
GO
