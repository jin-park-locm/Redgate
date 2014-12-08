SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  procedure [dbo].[usp_LC_GET_MemberList_forPartner]  
@lPartnerID int

as
SET NOCOUNT ON
-- [dbo].[usp_LC_GET_MemberList_forPartner] 1
 
BEGIN
	SELECT DISTINCT 
		m.lMemberID,
		m.szLoginEmail as szLoginName,
		m.dtStart
  	FROM tblLP_MemberInfo m  
	JOIN tblLP_PartnerSiteMember psm ON psm.lMemberID = m.lMemberID
	JOIN tblLP_PartnerSite		 s	 ON s.lSiteID = psm.lSiteID
	JOIN tblLP_Partner			 p   ON p.lPartnerID = s.lPartnerID 
	WHERE p.lPartnerID =  @lPartnerID
	AND psm.sSiteType = 'PT'
	ORDER BY 
	m.dtStart DESC,
	m.szLoginEmail
END

	
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartner] TO [web_user]
GO
