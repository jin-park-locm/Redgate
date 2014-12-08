SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[Usp_LC_GET_SecurityLevel]     @szSecurityLevel	varchar(25)    ,@sActive			char(1)		='Y'    ,@szUpdatedBy		varchar(20) = 'UI'    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ON DECLARE @lSecurityLevelID intBEGIN    INSERT INTO [dbo].[tblAL_SecurityLevel]    (          [szSecurityLevel]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @szSecurityLevel        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtUpdate,Getdate())            )IF @@ERROR = 0BEGIN	SELECT @lSecurityLevelID = SCOPE_IDENTITY()	SELECT @lSecurityLevelID AS lSecurityLevelIDENDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel] TO [web_user]
GO
