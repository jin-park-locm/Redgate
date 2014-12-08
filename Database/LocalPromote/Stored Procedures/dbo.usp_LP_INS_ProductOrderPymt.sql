SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_INS_ProductOrderPymt]
		 @lOrderNo			int
		,@lCreditCardID		int
		,@lTransactionID	int
		,@mPymtAmount		Money
		,@sPymtType			char(2)
		,@szUpdatedBy		varchar(20)
as
set nocount on

insert into dbo.tblLP_ProductOrderPymt(lOrderNo
										,lCreditCardID
										,lTransactionID
										,mPymtAmount
										,sPymtType
										,szUpdatedBy)
select @lOrderNo
		,@lCreditCardID
		,@lTransactionID
		,@mPymtAmount
		,@sPymtType
		,@szUpdatedBy
GO
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_ProductOrderPymt] TO [web_user]
GO
