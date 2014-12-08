SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[Usp_LC_GET_PartnerSiteAll]

@lPartnerid int

as
SET NOCOUNT ON

SELECT DISTINCT 
	ps.lSiteID,
	ps.szSiteName
FROM
	tblLP_PartnerSite ps
WHERE
	ps.lPartnerid = @lPartnerID 
	AND (ps.sActive = 'Y') -- OR ps.sSiteType ='PT')
ORDER BY 
	ps.szSiteName
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteAll] TO [web_user]
GO
