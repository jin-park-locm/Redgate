SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Check_PartnerSite_Active]
@lPartnerID int = NULL,
@lSiteID	int = NULL
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

--IF @lPartnerID IS NOT NULL
SELECT 
	p.lSiteID,
	p.lPartnerID,
	m.lMemberID,
	p.sSiteType,
	p.szSiteName,
	p.szSiteLogoPath,
	p.sSitePhone,
	p.szSiteEmail,
	p.szSSURL,
	p.lDistTypeid,
	p.sMyKeyword,
	p.sActive,
	p.szUpdatedBy,
	p.dtUpdate,
	p.SiteLongID

FROM tblLP_Partner ps
JOIN tblLP_PartnerSite p ON ps.lPartnerID = p.lPartnerID
JOIN tblLP_PartnerSiteMember m ON  m.lSiteID = P.lSiteID
WHERE 
p.sActive = 'y'
AND 
(
	(p.lPartnerID  = ISNULL (@lPartnerID,p.lPartnerID ))
	OR 
	(p.lSiteID	   = ISNULL (@lSiteID,p.lSiteID) )
)
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_PartnerSite_Active] TO [web_user]
GO
