SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSite_BillingMethod]
	@lSiteID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT 
		DISTINCT
		p.lBillingID, 
		b.szBillingDesc
FROM	tblLP_PartnerSiteBilling p
JOIN	tblAL_BillingMethod	  b		ON	b.lBillingID = p.lBillingID
WHERE	lSiteID	= 	@lSiteID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_BillingMethod] TO [web_user]
GO
