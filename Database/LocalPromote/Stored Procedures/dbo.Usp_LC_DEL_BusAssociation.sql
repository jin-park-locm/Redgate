SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusAssociation]     @lAdvertiserID  int    ASSET NOCOUNT ON-- MIBEGIN    DELETE FROM [dbo].[tblLP_BusAssociation]    WHERE lAdvertiserID = @lAdvertiserIDIF @@ERROR <> 0SELECT @lAdvertiserID AS lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusAssociation] TO [web_user]
GO
