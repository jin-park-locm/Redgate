SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusPaymentMethodN]
		@lPymtTypeID		int
		,@lAdvertiserID		int
    
AS
SET NOCOUNT ON

BEGIN

	UPDATE	[dbo].[tblLP_BusPaymentMethod]
	SET		sActive = 'N',
			dtUpdate = getdate()
	WHERE [lAdvertiserID] = @lAdvertiserID
	and lPymtTypeID = @lPymtTypeID 

IF @@ERROR <> 0
SELECT @lAdvertiserID AS lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethodN] TO [web_user]
GO
