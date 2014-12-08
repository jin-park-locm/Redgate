SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_RW_GET_AuthMemberInfoByEmail]
/**********************************************************************************
Description   :  Get Authorized Reviewer Information

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-04-2008 jkang    Initial Development

EXAMPLES: 	usp_RW_GET_AuthMemberInfoByEmail 'ctsang@local.com'

**********************************************************************************/	
@Email varchar(100)
	
AS
Select Distinct
	m.lMemberId as MemberID, 
	szLoginEmail as LoginEmail, 
	szPassword as Password, 
	szDisplayName as DisplayName,
	m.szFirstName as FirstName,
	m.szLastName as LastName,  
	m.sUserType as UserType, 
	szUserDesc as UserDesc, 
	l.szSecurityLevel as SecurityLevel,
	us.sStatus as Status,
	m.sActive as Active
	From tblLP_MemberInfo m (nolock)
	left Join tblRW_UserInfo p (nolock)
	On m.lMemberId = p.lMemberId
	Left Join tblLP_MemberSecurity s (nolock)
	On m.lMemberId = s.lMemberId
	Left Join tblAL_SecurityLevel l (nolock)
	On s.lSecurityLevelID = l.lSecurityLevelID
	Left Join tblAL_UserType u (nolock)
	On m.sUserType = u.sUserType
	Left Join tblRW_Userstatus us (nolock)
	On m.lMemberID = us.lMemberID
	Where szLoginEmail = @Email
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfoByEmail] TO [web_user]
GO
