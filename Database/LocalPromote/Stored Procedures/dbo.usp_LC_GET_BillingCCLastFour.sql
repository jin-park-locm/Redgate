SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BillingCCLastFour] 
@lOrderNo int
AS

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT sCardLast4
FROM tblLP_memberCCinfo c
JOIN tblLP_MemberCCTransaction t ON t.lCreditCardID = c.lCreditCardID
--JOIN tblLP_BusListing   b	ON b.lMemberID = c.lMemberID
WHERE t.lOrderNo = @lOrderNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingCCLastFour] TO [web_user]
GO
