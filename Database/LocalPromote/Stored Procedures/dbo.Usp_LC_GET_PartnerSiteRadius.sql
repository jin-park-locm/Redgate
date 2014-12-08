SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_PartnerSiteRadius]     @lSiteID  int    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT         --[lSiteID],         [lSearchMile]--        ,[sActive]--        ,[szUpdatedBy]--        ,[dtUpdate]	FROM  [dbo].[tblLP_PartnerSiteRadius]    WHERE [lSiteID] = @lSiteID         END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteRadius] TO [web_user]
GO
