SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] -- mod by Linh
@lMemberID int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


/* old
BEGIN
	SELECT
	pm.lMemberID,
	 s.lPartnerID,
	 p.szPartnerName,
	 s.lSiteID,
	 s.szSiteName
	FROM tblLP_PartnerSiteMember pm 
	JOIN tblLP_PartnerSite s		ON s.lSiteID = pm.lSiteID
	JOIN tblLP_Partner p  ON p.lPartnerID = s.lPartnerID 
	WHERE pm.lMemberID = @lMemberID
END

*/

-- Only care about advertiser who has premium listing(s).
SELECT DISTINCT 
	 b.lMemberID,
	 p.lPartnerID,
	 p.szPartnerName,
	 ps.lSiteID

	 --ps.szSiteName,
	 --b.lAdvertiserID,
	 --pl.sActive,
	 --pl.sListingType
	 --o.sActive,
	 --o.lOrderNo

FROM tblLP_PartnerSite ps		
JOIN tblLP_Partner p  ON ps.lPartnerID = p.lPartnerID --AND p.lPartnerID <>1
JOIN tblLP_ProductCampaign pc ON pc.lSiteID = ps.lSiteID
JOIN tblLP_ProductOrder o ON o.lCIDno = pc.lCIDno   AND o.sActive = 'Y' 
--left JOIN tblLP_PartnerListing pl ON pl.lSiteID = ps.lSiteID AND ( pl.sActive='Y') -- AND pl.sListingType ='FRE' ) 
JOIN tblLP_BusListing b ON b.lAdvertiserID = o.lAdvertiserID 
WHERE b.lMemberID = @lMemberID 
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_forAdvertiser] TO [web_user]
GO
