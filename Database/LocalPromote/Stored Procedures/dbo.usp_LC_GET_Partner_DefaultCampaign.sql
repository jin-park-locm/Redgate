SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Partner_DefaultCampaign]
@lPartnerID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

/*
SELECT lCIDNo
FROM tblLP_ProductCampaign
WHERE lPartnerID = @lPartnerID
AND sDefault = 'Y'

If @@ROWCOUNT = 0
*/

BEGIN

	SELECT 
			 szCID
			,lCIDNo
			,lProductID 
			,mSpecialPrice

	FROM tblLP_ProductCampaign  c
	JOIN tbllp_Partnersite		s ON s.lSiteID = c.lSiteID
	WHERE 	s.lPartnerID	= @lPartnerID
	AND     s.sSiteType		= 'PT'
	AND     c.sDefault		= 'Y'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_DefaultCampaign] TO [web_user]
GO
