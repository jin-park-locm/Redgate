SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingBillingType] 
@lOrderNo int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT
	  m.lBillingID
	, m.szBillingDesc 
FROM tblAL_BillingMethod m
JOIN tblLP_ProductOrder  p	ON p.lBillingID = m.lBillingID
WHERE p.lOrderNo = @lOrderNo

--AND p.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingBillingType] TO [web_user]
GO
