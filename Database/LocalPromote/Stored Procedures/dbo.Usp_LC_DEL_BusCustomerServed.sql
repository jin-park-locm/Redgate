SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusCustomerServed]
--     @lServiceTypeID  int
		@lAdvertiserID   int
    
AS
SET NOCOUNT ON

BEGIN

    DELETE FROM [dbo].[tblLP_BusCustomerServed]
    WHERE	[lAdvertiserID]  = @lAdvertiserID

IF @@ERROR <> 0
SELECT    @lAdvertiserID AS lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusCustomerServed] TO [web_user]
GO
