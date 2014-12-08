SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusProductOffered]     @lAdvertiserID  int    ASSET NOCOUNT ON
BEGIN    DELETE FROM [dbo].[tblLP_BusProductOffered]    WHERE lAdvertiserID = @lAdvertiserIDENDIF @@ERROR <> 0SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOffered] TO [web_user]
GO
