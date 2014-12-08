SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_SecurityPermission]     @lSecurityLevelID			int    ,@lSecurityActionID			int    ,@lSecurityRoleID			int    ,@sSiteSpecific				char(1)		= NULL    ,@sActive					char(1)		= 'Y'    ,@szUpdatedBy				varchar(20)	= 'UI'    ,@dtUpdate					datetime	= NULL    ASSET NOCOUNT ON BEGIN    INSERT INTO [dbo].[tblLP_SecurityPermission]    (          [lSecurityLevelID]        ,[lSecurityActionID]        ,[lSecurityRoleID]        ,[sSiteSpecific]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lSecurityLevelID        ,@lSecurityActionID        ,@lSecurityRoleID        ,@sSiteSpecific        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtUpdate,Getdate())            )IF @@ERROR = 0SELECT	@lSecurityLevelID		AS lSecurityLevelID, 		@lSecurityRoleID		AS lSecurityRoleID, 		@lSecurityActionID		AS lSecurityActionIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [web_user]
GO
