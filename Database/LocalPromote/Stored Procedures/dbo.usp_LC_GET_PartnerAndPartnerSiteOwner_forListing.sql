SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing]
@lAdvertiserID int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

-- [usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] @lAdvertiserID =  122488
 
BEGIN
	SELECT DISTINCT
			 s.lPartnerID,
			 p.szPartnerName,
			 s.lSiteID,
			 s.szSiteName
	FROM tblLP_PartnerSite			s		 
	JOIN tblLP_Partner				p		ON p.lPartnerID = s.lPartnerID 
	Join tblLP_PartnerListing		l		ON l.lSiteID	= s.lSiteID
	WHERE l.lAdvertiserID = @lAdvertiserID
	AND   l.sListingType  = 'PAY'
	AND	  l.sActive = 'Y'
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSiteOwner_forListing] TO [web_user]
GO
