SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_UPD_Category_forCourtesyListing] 
@lCCListingID int = null,
@RID int = null,
@BDC int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

IF @lCCListingID IS NOT NULL
BEGIN
	UPDATE 	[dbo].[tblCC_acxBDC]		
	--JOIN [dbo].[glb_tbl_BDC]		b	ON a.BDC = b.BDC
	--JOIN [dbo].[tblCC_acxListing]	c	ON c.RID = a.RID
	SET sAction = 'DEL'
	WHERE lCCListingID  = @lCCListingID
	AND BDC = @BDC


IF @@ERROR = 0 
	BEGIN
		SELECT @lCCListingID AS lCCListingID
	END
END

IF @RID IS NOT NULL
BEGIN
	UPDATE 	[dbo].[tblCC_acxBDC] 
	SET sAction = 'DEL'
	WHERE RID  = @RID
	AND BDC = @BDC

IF @@ERROR = 0 
	BEGIN
		SELECT @RID AS RID
	END
END



GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Category_forCourtesyListing] TO [web_user]
GO
