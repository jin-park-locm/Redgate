SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo]

@lOrderNo int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT DISTINCT
	c.lProductID, 
	l.szProductName  
FROM tblLP_ProductOrder o
JOIN tblLP_ProductCampaign    c	ON c.lCIDNo = o.lCIDNo
JOIN tblLP_ProductList  l	ON l.lProductID = c.lProductID
WHERE o.lOrderNo = @lOrderNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Product_Associated_with_ListingOrderNo] TO [web_user]
GO
