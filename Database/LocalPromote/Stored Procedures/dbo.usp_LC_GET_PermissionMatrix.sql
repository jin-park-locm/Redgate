SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_PermissionMatrix] 
	@lSecurityLevelID int
AS
BEGIN
	SET NOCOUNT ON
  	SELECT lSecurityActionID, lSecurityRoleID, sSiteSpecific
		FROM tblLP_SecurityPermission
		WHERE lSecurityLevelID = @lSecurityLevelID
		and sActive = 'Y'
		
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PermissionMatrix] TO [web_user]
GO
