SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_Category_forCourtesyListingN] 
@lCCListingID int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

BEGIN
--	DELETE a
--	FROM [dbo].[tblCC_acxBDC]		a
--	JOIN [dbo].[glb_tbl_BDC]		b	ON a.BDC = b.BDC
--	JOIN [dbo].[tblCC_acxListing]	c	ON c.RID = a.RID
--	WHERE c.lCCListingID  = @lCCListingID

	update a
	set sAction = 'DEL'
		,dtUpdate = getdate()
	FROM [dbo].[tblCC_acxBDC]		a
	JOIN [dbo].[glb_tbl_BDC]		b	ON a.BDC = b.BDC
	JOIN [dbo].[tblCC_acxListing]	c	ON c.RID = a.RID
	WHERE c.lCCListingID  = @lCCListingID


IF @@ERROR <> 0 
	BEGIN
		SELECT @lCCListingID AS lCCListingID
	END
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_Category_forCourtesyListingN] TO [web_user]
GO
