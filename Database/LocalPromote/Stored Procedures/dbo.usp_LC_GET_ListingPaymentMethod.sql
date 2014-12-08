SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingPaymentMethod] 
 
@lOrderNo	int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

BEGIN

SELECT  DISTINCT
			b.szBillingDesc
FROM 
		tblAL_BillingMethod b
left JOIN    tblLP_ProductOrder	   o    ON o.lBillingID   = b.lBillingID 
WHERE   o.lOrderNo = @lOrderNo
AND     b.sActive = 'Y' 


END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingPaymentMethod] TO [web_user]
GO
