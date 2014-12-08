SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL]
@szSSURL	varchar(100)
 
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED


SELECT @szSSURL =  ltrim(rtrim(@szSSURL))
BEGIN
	SELECT 
			 pp.lPartnerID
			,pp.szPartnerName
			,ps.lSiteID
			,ps.szSiteName
			,pp.szPartnerLogoPath
			,pp.szPartnerEmail
			,pp.sContactPhone
			,ps.szSiteLogoPath
			,ps.szSiteEmail
			,ps.sSitePhone

			,pp.szSSURL
			,ps.szSSURL

	FROM	tblLP_PartnerSite ps
	JOIN	tblLP_Partner	  pp		ON ps.lPartnerID = pp.lPartnerID
	WHERE	
	(pp.szSSURL = @szSSURL OR ps.szSSURL = @szSSURL)
 

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerAndPartnerSite_bySSURL] TO [web_user]
GO
