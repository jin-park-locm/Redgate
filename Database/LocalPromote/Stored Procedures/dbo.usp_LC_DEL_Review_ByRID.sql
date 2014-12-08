SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Review_ByRID]     @lReviewID  int    AS 
SET NOCOUNT ONBEGIN--    DELETE FROM [dbo].[tblRW_LocalReview]--    WHERE [lReviewID] = @lReviewID	UPDATE l	SET sActive = 'N'	FROM [dbo].[tblRW_LocalReview] l    WHERE l.[lReviewID] = @lReviewIDIF @@ERROR <> 0SELECT @lReviewID AS lReviewIDEND
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Review_ByRID] TO [web_user]
GO
