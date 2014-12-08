SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusCustomerServedN]
     @lServiceTypeID	int
	,@lAdvertiserID		int
 
AS
SET NOCOUNT ON

BEGIN

	UPDATE	[dbo].[tblLP_BusCustomerServed]
	SET		sActive = 'N',
			dtUpdate = getdate()
	WHERE	[lServiceTypeID]  = @lServiceTypeID
	and		lAdvertiserID	= @lAdvertiserID	

IF @@ERROR <> 0
SELECT    @lServiceTypeID AS lServiceTypeID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServedN] TO [web_user]
GO
