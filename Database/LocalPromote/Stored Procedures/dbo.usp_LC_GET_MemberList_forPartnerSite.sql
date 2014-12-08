SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  procedure [dbo].[usp_LC_GET_MemberList_forPartnerSite]  
@lSiteID int

as
SET NOCOUNT ON
-- [dbo].[usp_LC_GET_MemberList_forSite] 2
 
BEGIN
	SELECT DISTINCT 
		m.lMemberID,
		m.szLoginEmail as szLoginName ,
		m.dtStart 
  	FROM tblLP_MemberInfo m  
	JOIN tblLP_PartnerSiteMember psm ON psm.lMemberID = m.lMemberID
	JOIN tblLP_PartnerSite		 s	 ON s.lSiteID = psm.lSiteID
	--JOIN tblLP_Partner			 p  ON p.lPartnerID = s.lPartnerID 
	WHERE s.lSiteID =   @lSiteID
	AND psm.sSiteType = 'PS'
	ORDER BY 
	m.dtStart DESC,
	m.szLoginEmail
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberList_forPartnerSite] TO [web_user]
GO
