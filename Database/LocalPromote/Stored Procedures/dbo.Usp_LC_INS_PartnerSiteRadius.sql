SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_PartnerSiteRadius]
SELECT  @lSiteID	AS lSiteID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteRadius] TO [web_user]
GO