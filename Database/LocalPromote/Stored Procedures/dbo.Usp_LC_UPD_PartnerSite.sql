SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_PartnerSite]
SELECT @lSiteID as lSiteID

GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [web_user]
GO