SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_MemberSecurity]     @lMemberID			int    ,@lSecurityLevelID  int    ,@sActive			char(1)	= 'Y'      ASSET NOCOUNT ON BEGIN     INSERT INTO [dbo].[tblLP_MemberSecurity]    (          [lMemberID]        ,[lSecurityLevelID]        ,[sActive]        ,[dtUpdate]            )    VALUES    (         @lMemberID        ,@lSecurityLevelID        ,@sActive        ,Getdate()            )IF @@ERROR = 0SELECT @lMemberID		   AS lMemberID , 	   @lSecurityLevelID   AS lSecurityLevelID   END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberSecurity] TO [web_user]
GO
