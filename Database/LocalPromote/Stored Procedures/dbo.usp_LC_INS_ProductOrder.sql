SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_ProductOrder]  
@lCIDNo				int,
@lBillingID			int,
@lSalesPersonID		int,
@mPaidFee			money		= NULL,
@lBillingCycle		int,
@lAdvertiserID		int,
--@dtBeginning		datetime	= getdate(),
@dtEnd				datetime	= NULL,
@sActive			char(1)		= 'Y',
@szUpdatedBy		varchar(20) = 'UI',
@dtUpdate			datetime
 
AS  
  
SET NOCOUNT ON  

DECLARE @lOrderNo int

BEGIN
INSERT INTO tblLP_ProductOrder
(
		lCIDNo,
		lBillingID,
		lSalesPersonID,
		mPaidFee,
		lBillingCycle,
		lAdvertiserID,
		dtBeginning,
		dtEnd,
		sActive,
		szUpdatedBy,
		dtUpdate
)

Values(
		@lCIDNo,
		@lBillingID,
		@lSalesPersonID,
		@mPaidFee,
		@lBillingCycle,
		@lAdvertiserID,
		getdate(),
		@dtEnd,
		@sActive,
		@szUpdatedBy,
		getdate()
)

END
IF @@ERROR = 0
BEGIN
	SELECT @lOrderNo = SCOPE_IDENTITY()
	SELECT @lOrderNo AS lOrderNo
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ProductOrder] TO [web_user]
GO
