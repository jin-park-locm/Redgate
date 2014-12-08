SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_MemberSecurity]     @lMemberID  int    ,@lSecurityLevelID  int    ASBEGIN    DELETE FROM [dbo].[tblLP_MemberSecurity]    WHERE [lMemberID] = @lMemberID AND [lSecurityLevelID] = @lSecurityLevelIDIF @@ERROR <> 0SELECT @lMemberID AS lMemberID, @lSecurityLevelID AS lSecurityLevelIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurity] TO [web_user]
GO
