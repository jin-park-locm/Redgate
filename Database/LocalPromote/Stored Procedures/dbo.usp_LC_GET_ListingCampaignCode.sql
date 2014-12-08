SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingCampaignCode]

@lOrderNo		int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT distinct 
				c.lCIDNo, 
				c.szSpecialName
FROM tblLP_ProductCampaign c
JOIN tblLP_ProductOrder  p	ON p.lCIDNo = c.lCIDNo
WHERE p.lOrderNo = @lOrderNo
-- AND c.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCampaignCode] TO [web_user]
GO
