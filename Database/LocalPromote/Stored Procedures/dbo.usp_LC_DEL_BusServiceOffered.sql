SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusServiceOffered]     @lAdvertiserID  int    ASSET NOCOUNT ON
BEGIN    DELETE FROM [dbo].[tblLP_BusServiceOffered]    WHERE lAdvertiserID = @lAdvertiserIDENDIF @@ERROR <> 0SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOffered] TO [web_user]
GO
