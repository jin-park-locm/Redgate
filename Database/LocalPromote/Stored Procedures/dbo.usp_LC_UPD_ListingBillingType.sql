SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingBillingType] 
@lOrderNo	   int,
@lBillingID	   int
AS 
SET NOCOUNT ON


BEGIN

	UPDATE p
		  SET 
			P.lBillingID	= @lBillingID
	FROM	tblLP_ProductOrder  p 
	WHERE p.lOrderNo = @lOrderNo

	--AND p.sActive = 'Y'
	IF @@ERROR = 0
	SELECT	@lBillingID	AS lBillingID, szBillingDesc 
	FROM	tblAL_BillingMethod
	WHERE	lBillingID = @lBillingID

--	SELECT	 @lOrderNo AS lOrderNo
--			,@lBillingID	AS lBillingID				
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingBillingType] TO [web_user]
GO
