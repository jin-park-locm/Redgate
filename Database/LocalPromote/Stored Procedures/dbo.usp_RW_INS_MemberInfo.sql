SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_RW_INS_MemberInfo]
@LoginEmail varchar(100),
@password   varchar(20),
@LastName   Varchar(50),
@FirstName  Varchar(50)

as
Set NoCOUNT ON

if (select count(*) from tblLP_MemberInfo where szLoginEmail=@LoginEmail)>0

BEGIN
     update tblLP_MemberInfo
     set sUserType='BR'
     Where szLoginEmail=@LoginEmail

END
ELSE
BEGIN
     Insert into tblLP_MemberInfo
     (szLoginEmail,szPassword,sUserType,szLastName,szFirstName,sTermsAccepted,sActive)
     Values(@LoginEmail,@Password,'RR',@LastName,@FirstName,'Y','Y')
END

GO
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_MemberInfo] TO [web_user]
GO
