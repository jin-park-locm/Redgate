SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_PartnerAll]   ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT          [lPartnerID]        ,[szPartnerName]        ,[szPartnerLogoPath]        ,[sContactPhone]        ,[szPartnerEmail]--        ,[szSSURL]--        ,[szWebSite]--        ,[sActive]--        ,[szUpdatedBy]--        ,[dtUpdate]	FROM [dbo].[tblLP_Partner] p ORDER BY [szPartnerName]END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerAll] TO [web_user]
GO
