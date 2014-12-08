SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_SecurityPermission]     @lSecurityLevelID			int    ,@lSecurityActionID			int    ,@lSecurityRoleID			int    ,@sSiteSpecific				char(1)		= NULL    ,@sActive					char(1)		= NULL    ,@szUpdatedBy				varchar(20)	= 'UI'    ,@dtUpdate					datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_SecurityPermission]    SET          [lSecurityLevelID]		= ISNULL(@lSecurityLevelID, [lSecurityLevelID])        ,[lSecurityActionID]	= ISNULL(@lSecurityActionID, [lSecurityActionID])        ,[lSecurityRoleID]		= ISNULL(@lSecurityRoleID, [lSecurityRoleID])        ,[sSiteSpecific]		= ISNULL(@sSiteSpecific, [sSiteSpecific])        ,[sActive]				= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]			= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]				= ISNULL(@dtUpdate, Getdate())            WHERE [lSecurityLevelID] = @lSecurityLevelID AND [lSecurityActionID] = @lSecurityActionID AND [lSecurityRoleID] = @lSecurityRoleIDIF @@ERROR = 0SELECT  @lSecurityLevelID  AS lSecurityLevelID, 		@lSecurityRoleID   AS lSecurityRoleID, 		@lSecurityActionID AS lSecurityActionIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_SecurityPermission] TO [web_user]
GO
