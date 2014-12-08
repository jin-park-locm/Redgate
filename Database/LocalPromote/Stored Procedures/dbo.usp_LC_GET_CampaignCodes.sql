SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_CampaignCodes]@lAdvertiserID int,@lProductID	   int     AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSET NOCOUNT ON BEGIN    SELECT DISTINCT         c.[lCIDNo]        ,c.[szSpecialName] 	FROM  [dbo].[tblLP_ProductCampaign] c	JOIN  [dbo].[tblLP_ProductOrder]	o	ON	o.lCIDNo = c.lCIDNo
	WHERE 
		lProductID = @lProductID
	AND	o.lAdvertiserID = @lAdvertiserID
	AND c.[sActive] = 'Y'     END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CampaignCodes] TO [web_user]
GO
