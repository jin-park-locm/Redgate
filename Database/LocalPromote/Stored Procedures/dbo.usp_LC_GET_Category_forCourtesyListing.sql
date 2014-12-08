SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_GET_Category_forCourtesyListing] 
@lCCListingID int = NULL,
@RID int = NULL 

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


IF @lCCListingID IS NOT NULL -- Mod  by Linh
BEGIN
DECLARE @TbleOut Table(lCCListingID int, BDC int, sAction varchar(3), Title varchar(265))
	
	INSERT INTO @TbleOut
	SELECT	DISTINCT
			 c.lCCListingID
	    	,b.BDC
			,a.sAction
		    ,ISNULL(b.DisplayTitle, b.Title) as Title
	FROM [dbo].[tblCC_acxBDC]		a
	JOIN [dbo].[glb_tbl_BDC]		b	ON a.BDC = b.BDC
	JOIN [dbo].[tblCC_acxListing] c ON c.lCCListingID = a.lCCListingID
	WHERE c.lCCListingID  = @lCCListingID
	AND		a.sDBState = 'NEW' 
	AND		a.dtTurn is null
	ORDER BY Title

SELECT * FROM @TbleOut
END 

/*
IF @@ROWCOUNT <> 0 
	BEGIN
		SELECT * FROM @TbleOut
	END
ELSE
*/
IF @RID IS NOT NULL -- mod by Linh
BEGIN
	SELECT DISTINCT
		   --c.lCCListingID
	       l.RID
		  ,b.BDC
		  ,ISNULL(b.DisplayTitle, b.Title) as Title
    FROM [ListingStoreMaster].[dbo].[acx_map_listingbdc] l
	JOIN [dbo].[glb_tbl_BDC]		b	ON l.BDC = b.BDC
	--JOIN [dbo].[tblCC_acxListing]	c	ON c.RID = l.RID
	WHERE l.RID  = @RID
	ORDER BY Title
END




GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListing] TO [web_user]
GO
