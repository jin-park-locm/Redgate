SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_RW_GET_AuthMemberInfo]
/**********************************************************************************
Description   :   Get the review users

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-28-2008 John Lu    Initial Development

EXAMPLES: 	usp_RW_GET_AuthMemberInfo 'Y' -- Get all records
		
**********************************************************************************/
	
	@ForAll Char='N'
	
AS
If @ForAll = 'Y'
Begin
Select  
	m.lMemberId as MemberID, 
	szLoginEmail as LoginEmail, 
	szPassword as Password, 
	szDisplayName as DisplayName, 
	m.sUserType as UserType, 
	szUserDesc as UserDesc, 
	l.szSecurityLevel as SecurityLevel,
	m.sActive as Active
	From tblLP_MemberInfo m (nolock)
	Left Join tblRW_UserInfo p (nolock)
	On m.lMemberId = p.lMemberId
	Left Join tblLP_MemberSecurity s (nolock)
	On m.lMemberId = s.lMemberId
	Left Join tblAL_SecurityLevel l (nolock)
	On s.lSecurityLevelID = l.lSecurityLevelID
	Left Join tblAL_UserType u (nolock)
	On m.sUserType = u.sUserType
	where szLoginEmail is not null And szLoginEmail <> ''
		And p.lMemberId is not null
		And p.sActive = 'Y'
	order by LoginEmail
End
Else
Begin
  select * from (
	Select  top 35000
	m.lMemberId as MemberID, 
	szLoginEmail as LoginEmail, 
	szPassword as Password, 
	szDisplayName as DisplayName, 
	m.sUserType as UserType, 
	szUserDesc as UserDesc, 
	l.szSecurityLevel as SecurityLevel,
	m.sActive as Active,
	p.dtUpdate as DateUpdate
	From tblLP_MemberInfo m (nolock)
	Left Join tblRW_UserInfo p (nolock)
	On m.lMemberId = p.lMemberId
	Left Join tblLP_MemberSecurity s (nolock)
	On m.lMemberId = s.lMemberId
	Left Join tblAL_SecurityLevel l (nolock)
	On s.lSecurityLevelID = l.lSecurityLevelID
	Left Join tblAL_UserType u (nolock)
	On m.sUserType = u.sUserType
	where szLoginEmail is not null And szLoginEmail <> ''
		And p.lMemberId is not null
		And p.sActive = 'Y'
	order by DateUpdate desc
	) as d order by LoginEmail
End



GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_AuthMemberInfo] TO [web_user]
GO
