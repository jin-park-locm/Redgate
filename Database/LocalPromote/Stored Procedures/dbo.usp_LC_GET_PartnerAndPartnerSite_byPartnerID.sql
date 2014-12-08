SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID]
@lPartnerID int

as
SET NOCOUNT ON

 
BEGIN

	SELECT
	 s.lPartnerID,
	 p.szPartnerName,
	 s.lSiteID,
	 s.szSiteName
	FROM tblLP_PartnerSite s		
	JOIN tblLP_Partner p  ON p.lPartnerID = s.lPartnerID 
	WHERE   p.lPartnerID = @lPartnerID AND s.sSiteType = 'PT'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_byPartnerID] TO [web_user]
GO
