SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_CampaignCodes]
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
	WHERE 
		lProductID = @lProductID
	AND	o.lAdvertiserID = @lAdvertiserID
	AND c.[sActive] = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [web_user]
GO