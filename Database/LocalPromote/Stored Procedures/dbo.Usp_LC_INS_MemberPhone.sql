SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_MemberPhone]     @lMemberID		int    ,@sCountryCode  varchar(5)    ,@szPhone		varchar(12)    ,@szExt			varchar(5)	= NULL    ,@sPhoneType	char(1)      ,@sActive		char(1)		= 'Y'    ,@dtUpdate		datetime	= NULL    ASSET NOCOUNT ONDECLARE @lMemberPhoneID int BEGIN    INSERT INTO [dbo].[tblLP_MemberPhone]    (          [lMemberID]        ,[sCountryCode]        ,[szPhone]        ,[szExt]        ,[sPhoneType]        ,[sActive]        ,[dtUpdate]            )    VALUES    (         @lMemberID        ,@sCountryCode        ,@szPhone        ,@szExt        ,@sPhoneType        ,@sActive        ,ISNULL(@dtUpdate, Getdate())            )SET @lMemberPhoneID = SCOPE_IDENTITY()IF @@ERROR = 0SELECT @lMemberPhoneID AS lMemberPhoneID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_MemberPhone] TO [web_user]
GO
