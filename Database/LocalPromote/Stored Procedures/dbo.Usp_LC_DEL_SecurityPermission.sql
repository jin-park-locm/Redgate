SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_SecurityPermission]     @lSecurityLevelID  int    ,@lSecurityActionID  int    ,@lSecurityRoleID  int    ASSET NOCOUNT ONBEGIN    DELETE FROM [dbo].[tblLP_SecurityPermission]    WHERE	[lSecurityLevelID]	= @lSecurityLevelID 	AND		[lSecurityActionID] = @lSecurityActionID 	AND		[lSecurityRoleID]	= @lSecurityRoleIDIF @@ERROR <> 0SELECT	 @lSecurityLevelID   AS lSecurityLevelID		,@lSecurityActionID  AS lSecurityActionID   		,@lSecurityRoleID    AS lSecurityRoleID   END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_SecurityPermission] TO [web_user]
GO
