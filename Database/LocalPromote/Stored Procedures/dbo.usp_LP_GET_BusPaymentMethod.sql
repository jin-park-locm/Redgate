SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_GET_BusPaymentMethod]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	b.lPymtTypeID,
	pt.szPymtDesc,
	b.sActive
FROM 
	tblLP_BusPaymentMethod b
JOIN
	tblAL_PaymentType pt
ON	pt.lPymtTypeID = b.lPymtTypeID
WHERE
    b.lAdvertiserID = @lAdvertiserID
--AND	b.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BusPaymentMethod] TO [web_user]
GO
