SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_CustomersServed]
/**********************************************************************************
Description   :   Get Customer served

Change History

Date       Name     Description
---------- -------- ------------------------------------
unknown    Contractor    Initial Development
12/15/2009 dlabrie		Add Active as parameter - LPADMINB-889

EXAMPLES: 	usp_LC_GET_CustomersServed 62488, 'Y'
			usp_LC_GET_CustomersServed 62488, 'N'
			usp_LC_GET_CustomersServed 62488, null
**********************************************************************************/
@lAdvertiserID	int,
@sActive  char(1)='Y'

AS
SET NOCOUNT ON

IF @sActive is null

BEGIN

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

END

ELSE

BEGIN
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
	AND	cs.sActive = @sActive 
END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CustomersServed] TO [web_user]
GO
