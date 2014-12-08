SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_DEL_Category_forCourtesyListing] 
@lCCListingID int = null,
@RID int = null

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

IF @lCCListingID IS NOT NULL
BEGIN
	DELETE a
	FROM [dbo].[tblCC_acxBDC]		a
--	JOIN [dbo].[glb_tbl_BDC]		b	ON a.BDC = b.BDC
--	JOIN [dbo].[tblCC_acxListing]	c	ON c.RID = a.RID
	WHERE a.lCCListingID  = @lCCListingID


IF @@ERROR <> 0 
	BEGIN
		SELECT @lCCListingID AS lCCListingID
	END
END

IF @RID IS NOT NULL
BEGIN
	DELETE a
	FROM [dbo].[tblCC_acxBDC]		a
	WHERE a.RID  = @RID


IF @@ERROR <> 0 
	BEGIN
		SELECT @RID AS RID
	END
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListing] TO [web_user]
GO
