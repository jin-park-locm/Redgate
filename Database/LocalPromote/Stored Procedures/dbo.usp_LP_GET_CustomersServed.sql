SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_GET_CustomersServed]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	cs.lServiceTypeID,
	bt.szServiceType,
	cs.sActive
FROM 
	tblLP_BusCustomerServed cs
JOIN
	tblAL_BusServiceType bt
ON	bt.lServiceTypeID = cs.lServiceTypeID
WHERE
    cs.lAdvertiserID = @lAdvertiserID
--AND	cs.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CustomersServed] TO [web_user]
GO
