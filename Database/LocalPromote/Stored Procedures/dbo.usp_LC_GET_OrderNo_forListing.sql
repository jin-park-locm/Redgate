SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_OrderNo_forListing]
(	
	@lAdvertiserID  int,
	@lSiteID		int
)
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

---kjl 1111
SELECT DISTINCT
po.lOrderNo
FROM tblLP_ProductOrder po
INNER JOIN tblLP_BusListing pl ON pl.lAdvertiserID = po.lAdvertiserID
INNER JOIN tblLP_ProductCampaign pc ON pc.lCIDNo = po.lCIDNo
WHERE po.lAdvertiserID = @lAdvertiserID
AND pc.lSiteID = @lSiteID
AND po.sActive = 'Y'

--SELECT DISTINCT
--	po.lOrderNo
--FROM tblLP_ProductOrder				po
--INNER JOIN tblLP_BusListing			pl	ON pl.lAdvertiserID = po.lAdvertiserID
--INNER JOIN tblLP_ProductCampaign	pc	ON pc.lCIDNo = po.lCIDNo
--WHERE po.lAdvertiserID	= @lAdvertiserID
--AND   pc.lSiteID		= @lSiteID
--AND	  po.sActive		= 'Y'

--SELECT DISTINCT
--	po.lOrderNo
--FROM tblLP_ProductOrder			po
--JOIN tblLP_PartnerListing		pl		ON pl.lAdvertiserID = po.lAdvertiserID
--WHERE po.lAdvertiserID = @lAdvertiserID
--AND   pl.lSiteID	   = @lSiteID
--AND	  po.sActive = 'Y'

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_OrderNo_forListing] TO [web_user]
GO
