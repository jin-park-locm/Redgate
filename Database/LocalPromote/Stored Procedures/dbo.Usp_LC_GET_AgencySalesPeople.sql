SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_AgencySalesPeople]
	@sAgencyID int
AS

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN
SELECT 
	 s.lSalesPersonID
	,szFirstName
	,szLastName
	--,szFullName
	--,sActive
FROM tblLP_SalesPerson  s
JOIN tblLP_ProductOrder p	ON	p.lSalesPersonID = s.lSalesPersonID
JOIN tblLP_BusListing	b	ON  b.lAdvertiserID  = p.lAdvertiserID
WHERE 
		s.sActive			=	'Y'
AND		sAgencyID		    =	@sAgencyID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AgencySalesPeople] TO [web_user]
GO
