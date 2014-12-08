SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
Create PROCEDURE [dbo].[usp_LC_GET_SalesPersonForOrder]
/********************************************
Description   :   retrieve salesperson info for an order

Change History

Date		Name     Description
---------- -------- ------------------------------------
2-15-2010	dlabrie    Initial Development

Example:
usp_LC_GET_SalesPersonForOrder 104104


*********************************************/
@lOrderNo int
AS
SET NOCOUNT ON

SELECT 
S.szFirstName 
, S.szLastName 
, S.szFullName 
, S.sActive 
, S.sDisplay 
FROM dbo.tblLP_SalesPerson S 
INNER 
JOIN dbo.tblLP_ProductOrder PO 
ON PO.lSalesPersonID = S.lSalesPersonID 
WHERE PO.lOrderNo = @lOrderNo 

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPersonForOrder] TO [web_user]
GO
