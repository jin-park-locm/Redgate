SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_AllCustomerServed]
AS

SET NOCOUNT ON

SELECT
	lServiceTypeID,
	szServiceType
FROM 
	tblAl_BusServiceType
ORDER BY
	lServiceTypeID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCustomerServed] TO [web_user]
GO
