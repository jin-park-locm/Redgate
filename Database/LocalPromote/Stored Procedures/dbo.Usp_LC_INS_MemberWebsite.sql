SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_MemberWebsite]     @lMemberID			int    ,@szWebURL			varchar(150)    ,@sActive			char(1)		=	'Y'    ,@szUpdatedBy		varchar(50)	=	'UI'--   ,@dtUpdate			datetime    ASSET NOCOUNT ON BEGIN     INSERT INTO [dbo].[tblLP_MemberWebsite]    (          [lMemberid]        ,[szWebURL]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lMemberID        ,@szWebURL        ,@sActive        ,@szUpdatedBy        ,Getdate()            )IF @@ERROR = 0SELECT @lMemberID AS lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberWebsite] TO [web_user]
GO
