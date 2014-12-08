SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_PartnerSite]
BEGIN

	SELECT @lSiteID = SCOPE_IDENTITY()
	SELECT @lSiteID AS lSiteID
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [web_user]
GO