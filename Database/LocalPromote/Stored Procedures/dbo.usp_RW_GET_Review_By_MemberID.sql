SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_RW_GET_Review_By_MemberID]     @lMemberId  int    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT          [lReviewID]        ,[RID]        ,[iRating]        ,[szReviewTitle]        ,[szReviewText]        ,[lSiteID]        ,[sActive]        ,[dtActive]        ,[lMemberId]        ,[dtReview]	FROM [tblRW_LocalReview] 	WHERE lMemberId = @lMemberId END
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Review_By_MemberID] TO [web_user]
GO
