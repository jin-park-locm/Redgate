SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_BusPaymentMethod]
/**********************************************************************************
Description   :   Get business payment Method

Change History

Date       Name     Description
---------- -------- ------------------------------------
unknown    Contractor    Initial Development
12/15/2009 dlabrie		Add Active as parameter - LPADMINB-889

EXAMPLES: 	usp_LC_GET_BusPaymentMethod 62488, 'Y'
			usp_LC_GET_BusPaymentMethod 62488, 'N'
			usp_LC_GET_BusPaymentMethod 62488, null
**********************************************************************************/
@lAdvertiserID	int,
@sActive  char(1)='Y'

AS
SET NOCOUNT ON

IF @sActive is null

BEGIN

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
END

ELSE

BEGIN
	SELECT
		b.lPymtTypeID,
		pt.szPymtDesc
	FROM 
		tblLP_BusPaymentMethod b
	JOIN
		tblAL_PaymentType pt
	ON	pt.lPymtTypeID = b.lPymtTypeID
	WHERE
		b.lAdvertiserID = @lAdvertiserID
	AND	b.sActive = @sActive 
END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusPaymentMethod] TO [web_user]
GO
