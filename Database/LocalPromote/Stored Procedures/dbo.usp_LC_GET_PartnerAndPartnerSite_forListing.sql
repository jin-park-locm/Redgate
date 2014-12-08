SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing]
@lAdvertiserID int,
@lSiteID	   int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

BEGIN
SELECT 
	p.lPartnerID,
	p.szPartnerName,
	p.szPartnerLogoPath,
	p.sContactPhone,
	p.szPartnerEmail,
	p.szSSURL,
	p.szWebSite ,

	ps.lSiteID,
	ps.sSiteType,
	ps.szSiteName,
	ps.szSiteLogoPath,
	ps.sSitePhone,
	ps.szSiteEmail,
	--ps.szSSURL,
	ps.lDistTypeid,
	ps.sMyKeyword
	--, ps.sActive
	--ps.szUpdatedBy,
	--ps.dtUpdate,
	--ps.SiteLongID
FROM tblLP_Partner p
JOIN tblLP_PartnerSite ps ON ps.lPartnerID = p.lPartnerID
JOIN tblLP_PartnerListing pl   ON pl.lSiteID = ps.lSiteID
JOIN tblLP_BusListing b ON b.lAdvertiserID = pl.lAdvertiserID
WHERE b.lAdvertiserID = @lAdvertiserID
AND	pl.lSiteID	  = @lSiteID
AND	pl.sActive = 'Y'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forListing] TO [web_user]
GO
