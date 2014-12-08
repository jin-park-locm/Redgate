SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingCampaignCode]
  @lOrderNo			int 
, @lCIDNo			int
, @szSpecialName	varchar(60)

AS 
SET NOCOUNT ON


BEGIN

UPDATE c
	SET
--	c.lCIDNo		= @lCIDNo, 
	c.szSpecialName	= @szSpecialName
FROM tblLP_ProductCampaign c
JOIN tblLP_ProductOrder  p	ON p.lCIDNo = c.lCIDNo
WHERE p.lOrderNo = @lOrderNo
--AND   c.lCIDNo  = @lCIDNo
AND   c.sActive = 'Y'

IF @@ERROR = 0
SELECT @lOrderNo		 as lOrderNo

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingCampaignCode] TO [web_user]
GO
