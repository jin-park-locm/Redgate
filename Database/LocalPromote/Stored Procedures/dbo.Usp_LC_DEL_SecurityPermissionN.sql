SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_SecurityPermissionN]     @lSecurityLevelID  int    ,@lSecurityActionID  int    ,@lSecurityRoleID  int    ASSET NOCOUNT ONBEGIN--    DELETE FROM [dbo].[tblLP_SecurityPermission]--    WHERE	[lSecurityLevelID]	= @lSecurityLevelID --	AND		[lSecurityActionID] = @lSecurityActionID --	AND		[lSecurityRoleID]	= @lSecurityRoleID	update [dbo].[tblLP_SecurityPermission]	set sActive = 'N'	from [dbo].[tblLP_SecurityPermission]    WHERE	[lSecurityLevelID]	= @lSecurityLevelID 	AND		[lSecurityActionID] = @lSecurityActionID 	AND		[lSecurityRoleID]	= @lSecurityRoleIDIF @@ERROR <> 0SELECT	 @lSecurityLevelID   AS lSecurityLevelID		,@lSecurityActionID  AS lSecurityActionID   		,@lSecurityRoleID    AS lSecurityRoleID   END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermissionN] TO [web_user]
GO
