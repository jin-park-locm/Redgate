SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID]
@lSiteID int

as
SET NOCOUNT ON

 
BEGIN
	SELECT
	 s.lPartnerID,
	 p.szPartnerName,
	 s.lSiteID,
	 s.szSiteName,
	 s.sSiteType 
	FROM tblLP_PartnerSite s		
	JOIN tblLP_Partner p  ON p.lPartnerID = s.lPartnerID 
	WHERE   s.lSiteID = @lSiteID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySiteID] TO [web_user]
GO
