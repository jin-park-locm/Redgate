SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Campaign_BillingCycle]
	@lCIDNo int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT  DISTINCT
		p.lBillingCycle

FROM	tblLP_ProductOrder	  p
JOIN	tblAL_BillingCycle	  b		ON	b.lBillingCycle = p.lBillingCycle
JOIN    tblLP_ProductCampaign c		ON	c.lCIDNo		= p.lCIDNo
WHERE	p.lCIDNo	= 	@lCIDNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Campaign_BillingCycle] TO [web_user]
GO
