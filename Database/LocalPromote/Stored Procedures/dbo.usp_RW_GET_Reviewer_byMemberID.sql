SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_RW_GET_Reviewer_byMemberID]
@lMemberID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON
 
--  

SELECT  DISTINCT   
	  m.lMemberID
	, m.szLoginEmail
--	, m.szPassword
	, m.sUserType
	, m.szLastName
	, m.szMidName
	, m.szFirstName
	, m.sTermsAccepted
--	, m.sActive
--	, m.dtUpdate
	, m.szLoginName
	, p.szDisplayName

 FROM tblLP_MemberInfo m   
 JOIN tblRW_UserInfo p			On m.lMemberId = p.lMemberId  
-- LEFT JOIN tblLP_MemberSecurity s   On m.lMemberId = s.lMemberId  
-- LEFT JOIN tblAL_UserType u			On m.sUserType = u.sUserType  
 LEFT JOIN tblLP_BusListing	b			ON b.lMemberID   = m.lMemberID

 WHERE  m.lMemberID = @lMemberID
-- AND	p.sActive = 'Y'
-- AND	m.sUserType IN ('RR', 'BR')

  ORDER BY m.lMemberID
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_byMemberID] TO [web_user]
GO
