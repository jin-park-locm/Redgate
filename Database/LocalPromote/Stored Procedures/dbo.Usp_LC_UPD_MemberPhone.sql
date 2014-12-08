SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_MemberPhone]     @lMemberPhoneID	int    ,@lMemberID			int			= NULL    ,@sCountryCode		varchar(5)	= NULL    ,@szPhone			varchar(12)	= NULL    ,@szExt				varchar(5)	= NULL    ,@sPhoneType		char(1)		= NULL    ,@sActive			char(1)		= NULL    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_MemberPhone]    SET          [lMemberID]		= ISNULL(@lMemberID, [lMemberID])        ,[sCountryCode]		= ISNULL(@sCountryCode, [sCountryCode])        ,[szPhone]			= ISNULL(@szPhone, [szPhone])        ,[szExt]			= ISNULL(@szExt, [szExt])        ,[sPhoneType]		= ISNULL(@sPhoneType, [sPhoneType])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())            WHERE [lMemberPhoneID] = @lMemberPhoneIDSET @lMemberPhoneID = SCOPE_IDENTITY()IF @@ERROR = 0SELECT @lMemberPhoneID AS lMemberPhoneID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberPhone] TO [web_user]
GO
