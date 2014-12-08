SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Partner]     @lPartnerID  int   ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT          [lPartnerID]        ,[szPartnerName]        ,[szPartnerLogoPath]        ,[sContactPhone]        ,[szPartnerEmail]        ,[szSSURL]        ,[szWebSite]        ,[sActive]		,[dtStart]		,[dtEnd]--        ,[szUpdatedBy]--        ,[dtUpdate]	FROM [dbo].[tblLP_Partner] p 	WHERE [lPartnerID] = @lPartnerIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Partner] TO [web_user]
GO
