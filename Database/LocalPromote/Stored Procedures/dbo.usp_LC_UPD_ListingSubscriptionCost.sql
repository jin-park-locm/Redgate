SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingSubscriptionCost]  
  @lOrderNo			int
, @mPaidFee			money
AS 
SET NOCOUNT ON


BEGIN

UPDATE p
	SET
		 p.mPaidFee = @mPaidFee
FROM tblLP_ProductOrder p 
WHERE p.lOrderNo = @lOrderNo
AND  p.sActive = 'Y'
 
IF @@ERROR = 0
SELECT @lOrderNo AS lOrderNo

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSubscriptionCost] TO [web_user]
GO
