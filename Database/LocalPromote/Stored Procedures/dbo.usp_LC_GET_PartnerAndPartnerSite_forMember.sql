SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember]
@lMemberID int

as
SET NOCOUNT ON

 
BEGIN
	SELECT
	pm.lMemberID,
	s.lPartnerID,
	p.szPartnerName,
	s.lSiteID,
	s.szSiteName,
	p.szPartnerLogoPath,
	p.szPartnerEmail,
	p.sContactPhone,
	s.szSiteLogoPath,
	s.szSiteEmail,
	s.sSitePhone
	FROM tblLP_PartnerSiteMember pm 
	JOIN tblLP_PartnerSite s		ON s.lSiteID = pm.lSiteID
	JOIN tblLP_Partner p  ON p.lPartnerID = s.lPartnerID 
	WHERE pm.lMemberID = @lMemberID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forMember] TO [web_user]
GO
