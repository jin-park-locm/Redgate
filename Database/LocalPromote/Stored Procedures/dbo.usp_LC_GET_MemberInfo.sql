SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_MemberInfo] 
@lMemberID int
AS
SET NOCOUNT ON


BEGIN	 

	SELECT	m.lMemberID, m.szLoginEmail, m.szPassword, m.sUserType,
			m.szLastName , m.szMidName, m.szFirstName, m.sTermsAccepted,
			m.sActive, m.dtUpdate, m.szLoginName, m.dtStart, m.dtEnd
	From tblLP_MemberInfo		m (nolock)
--	Join tblLP_MemberAddress	a (nolock) On a.lMemberId = m.lMemberId
--	Join tblLP_MemberEmail		e (nolock) On e.lMemberId = m.lMemberId
--	Join tblLP_MemberPhone		p (nolock) On p.lMemberId = m.lMemberId
	WHERE m.lMemberID = @lMemberID
--	Order By  m.lMemberId

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo] TO [web_user]
GO
