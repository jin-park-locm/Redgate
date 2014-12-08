SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[usp_LC_GET_ListingSubscriptionCost] 
@lOrderNo int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT mPaidFee 
FROM tblLP_ProductOrder p 
WHERE p.lOrderNo = @lOrderNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingSubscriptionCost] TO [web_user]
GO
