SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique]     @szSecurityLevel	varchar(25)    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED BEGIN    SELECT 			lSecurityLevelID	FROM [dbo].[tblAL_SecurityLevel]	WHERE [szSecurityLevel]	= @szSecurityLevelEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_SecurityLevel_Check_Unique] TO [web_user]
GO
