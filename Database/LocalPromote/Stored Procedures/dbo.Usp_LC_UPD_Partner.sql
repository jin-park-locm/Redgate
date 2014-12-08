SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_Partner]
SELECT @lPartnerID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [web_user]
GO