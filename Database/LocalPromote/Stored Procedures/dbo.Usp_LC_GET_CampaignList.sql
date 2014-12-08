SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_CampaignList]
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [web_user]
GO