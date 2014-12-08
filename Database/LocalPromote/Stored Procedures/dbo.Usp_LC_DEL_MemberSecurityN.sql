SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_MemberSecurityN]     @lMemberID  int    ,@lSecurityLevelID  int    ASBEGIN--    DELETE FROM [dbo].[tblLP_MemberSecurity]--    WHERE [lMemberID] = @lMemberID AND [lSecurityLevelID] = @lSecurityLevelID	update [dbo].[tblLP_MemberSecurity]	set sActive = 'N'		,dtUpdate = getdate()	from [dbo].[tblLP_MemberSecurity]	WHERE [lMemberID] = @lMemberID 	AND [lSecurityLevelID] = @lSecurityLevelID	IF @@ERROR <> 0SELECT @lMemberID AS lMemberID, @lSecurityLevelID AS lSecurityLevelIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_MemberSecurityN] TO [web_user]
GO
