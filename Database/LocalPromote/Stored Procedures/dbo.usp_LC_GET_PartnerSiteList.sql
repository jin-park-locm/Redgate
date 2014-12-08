SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_LC_GET_PartnerSiteList]

@lPartnerid int

as
SET NOCOUNT ON

SELECT DISTINCT 
	ps.lSiteID,
	ps.szSiteName,
	ps.dtStart
FROM
	tblLP_PartnerSite ps
WHERE
	ps.lPartnerid = @lPartnerid
AND ps.sActive = 'Y'
--AND ps.sSiteType = 'PS' 
ORDER BY 
	ps.szSiteName ASC


GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteList] TO [web_user]
GO
