SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Review_ByRID]     @lReviewID  int    AS
SET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT          [lReviewID]        ,[RID]        ,[iRating]        ,[szReviewTitle]        ,[szReviewText]        ,[lSiteID]        ,[sActive]        ,[dtActive]        ,[lMemberId]        ,[dtReview]	FROM [tblRW_LocalReview] 	WHERE lReviewID = @lReviewID	and sActive = 'Y'  END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Review_ByRID] TO [web_user]
GO
