SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[Usp_LC_GET_PartnerSite]
	@lSiteID int
--,@lPartnerID int 

AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN

	SELECT DISTINCT 
		s.[lSiteID]
		,s.[lPartnerID]
		,s.[sSiteType]
		,s.[szSiteName]
		,s.[szSiteLogoPath]
		,s.[sSitePhone]
		,s.[szSiteEmail]
		,s.[szSSURL]
		,s.[lDistTypeid]
		,s.[sMyKeyword]
		,s.[sActive]
		,s.[szUpdatedBy]
		,s.[dtUpdate]
		,s.[SiteLongID]
		,s.[dtStart]
		,s.[dtEnd]
		,s.[AlternateProfileURLUse]
	FROM [dbo].[tblLP_PartnerSite] s
	WHERE s.[lSiteID] = @lSiteID 
	-- AND s.[sSiteType] = 'PS'
	-- AND [lPartnerID] = ISNULL(@lPartnerID, lPartnerID)
	ORDER BY s.lSiteID

END


GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSite] TO [web_user]
GO
