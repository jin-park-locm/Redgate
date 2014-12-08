SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_RW_UPD_ReviewStatusByMemberID]
@lMemberId int
AS

SET NOCOUNT ON


UPDATE lr
		SET sActive = 'N'
FROM tblRW_LocalReview lr
WHERE lr.lMemberId = @lMemberId

IF @@ERROR = 0
SELECT @lMemberId AS lMemberId
GO
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewStatusByMemberID] TO [web_user]
GO
