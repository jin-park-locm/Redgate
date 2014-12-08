SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

Create PROCEDURE [dbo].[usp_LC_UPD_ProductOrder] (
	@lOrderNo			INT
,	@lCIDNo				INT		= NULL
,	@lBillingID			INT		= NULL
,	@lSalesPersonID		INT		= NULL
,	@mPaidFee			MONEY	= NULL
,	@lBillingCycle		INT		= NULL
,	@sTimeCode			CHAR(2)	= NULL
,	@dtBeginning		DATETIME= NULL
,	@dtEnd				DATETIME= NULL
,	@sActive			CHAR(1)	= NULL
,	@szUpdatedBy		VARCHAR(20) = NULL
,	@dtUpdate			DATETIME = NULL
)
AS
/**********************************************************************************
Date       Name			Description
---------- --------		------------------------------------
02-17-2010 Randy Sesser Initial Development
**********************************************************************************/

BEGIN
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SET NOCOUNT ON

	DECLARE	@Err	INT
	SELECT	@Err	= 0

	IF EXISTS (SELECT 1 FROM dbo.tblLP_ProductOrder WHERE lOrderNo = @lOrderNo)
	BEGIN
		UPDATE	dbo.tblLP_ProductOrder
			SET	lCIDNo			= isNULL(@lCIDNo, lCIDNo)
			,	lBillingID		= isNull(@lBillingID, lBillingID)
			,	lSalesPersonID	= isNull(@lSalesPersonID, lSalesPersonID)
			,	mPaidFee		= isNull(@mPaidFee, mPaidFee)
			,	lBillingCycle	= isNull(@lBIllingCycle, lBillingCycle)
			,	sTimeCode		= isNull(@sTimeCode, sTimeCode)
			,	dtBeginning		= isNull(@dtBeginning, dtBeginning)
			,	dtEnd			= isNull(@dtEnd, dtEnd)
			,	sActive			= isNull(@sActive, sActive)
			,	szUpdatedBy		= isNull(@szUpdatedBy, 'UI')
			,	dtUpdate		= isNull(@dtUpdate, GETDATE())
		WHERE	lOrderNo		= @lOrderNo

		SET @Err = @@ERROR

		IF @Err = 0
			SELECT @lOrderNo as lOrderNo
	END

END



grant execute on usp_LC_UPD_ProductOrder to LocalConnect
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ProductOrder] TO [web_user]
GO
