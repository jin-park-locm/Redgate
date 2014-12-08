SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusDiscount]     @lAdvertiserID  int    ASSET NOCOUNT ONBEGIN    DELETE FROM [dbo].[tblLP_BusDiscount]    WHERE lAdvertiserID = @lAdvertiserIDIF @@ERROR <> 0SELECT @lAdvertiserID AS lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscount] TO [web_user]
GO
