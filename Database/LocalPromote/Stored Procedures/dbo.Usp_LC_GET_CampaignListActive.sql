SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_CampaignListActive]
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignListActive] TO [web_user]
GO