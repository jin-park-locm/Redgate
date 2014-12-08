SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_PartnerSiteBilling]     @lSiteID		int         ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN     SELECT          [lSiteID]        ,[lBillingID]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]    FROM [dbo].[tblLP_PartnerSiteBilling]	WHERE     lSiteID  = @lSiteID 	END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteBilling] TO [web_user]
GO
