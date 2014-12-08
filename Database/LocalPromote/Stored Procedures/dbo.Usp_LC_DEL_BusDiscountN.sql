SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusDiscountN]     @lBusDiscountID  int    ASSET NOCOUNT ONBEGIN		UPDATE	[dbo].[tblLP_BusDiscount]	SET		sActive = 'N',			dtUpdate = getdate()	WHERE lBusDiscountID = @lBusDiscountIDIF @@ERROR <> 0SELECT @lBusDiscountID AS lBusDiscountIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusDiscountN] TO [web_user]
GO
