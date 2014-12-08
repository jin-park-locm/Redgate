SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_AllPaymentMethod]
AS

SET NOCOUNT ON

SELECT
	lPymtTypeID,
	szPymtDesc
FROM 
	tblAl_PaymentType
WHERE
	sActive = 'Y'
ORDER by
	szPymtDesc
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllPaymentMethod] TO [web_user]
GO
