SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_MemberInfo]     @lMemberID			int    ,@szLoginEmail		varchar(150)	=	NULL    ,@szPassword		varchar(50)		=	NULL    ,@sUserType			char(2)			=	NULL    ,@szLastName		varchar(50)		=	NULL    ,@szMidName			varchar(50)		=	NULL    ,@szFirstName		varchar(50)		=	NULL    ,@sTermsAccepted	char(1)			=	NULL    ,@sActive			char(1)			=	NULL    ,@dtUpdate			datetime		=	NULL    ,@szLoginName		varchar(50)		=	NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_MemberInfo]    SET          [szLoginEmail]		= ISNULL(@szLoginEmail, [szLoginEmail])        ,[szPassword]		= ISNULL(@szPassword, [szPassword])        ,[sUserType]		= ISNULL(@sUserType, [sUserType])        ,[szLastName]		= ISNULL(@szLastName, [szLastName])        ,[szMidName]		= ISNULL(@szMidName, [szMidName])        ,[szFirstName]		= ISNULL(@szFirstName, [szFirstName])        ,[sTermsAccepted]	= ISNULL(@sTermsAccepted, [sTermsAccepted])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[dtUpdate]			= ISNULL(@dtUpdate, GetDate())        ,[szLoginName]		= ISNULL(@szLoginName, [szLoginName])            WHERE [lMemberID] = @lMemberIDIF @@ERROR = 0SELECT @lMemberID AS lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberInfo] TO [web_user]
GO
