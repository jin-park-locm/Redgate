SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusPaymentMethod]
--     @lPymtTypeID		int
		@lAdvertiserID		int
    
AS
SET NOCOUNT ON

BEGIN

    DELETE FROM [dbo].[tblLP_BusPaymentMethod]
    WHERE [lAdvertiserID] = @lAdvertiserID

IF @@ERROR <> 0
SELECT @lAdvertiserID AS lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusPaymentMethod] TO [web_user]
GO
