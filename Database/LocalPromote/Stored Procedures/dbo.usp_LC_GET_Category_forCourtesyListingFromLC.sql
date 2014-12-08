SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] 
@lCCListingID int = NULL,
@RID int = NULL 

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE @TbleOut Table(lCCListingID int, BDC int, Title varchar(265))
IF @lCCListingID IS NOT NULL -- Mod  by Linh
BEGIN
	INSERT INTO @TbleOut
	SELECT	DISTINCT
			 c.lCCListingID
	    	,b.BDC
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
IF @RID IS NOT NULL
BEGIN
/*	SELECT DISTINCT
		   --c.lCCListingID
	       l.RID
		  ,b.BDC
		  ,ISNULL(b.DisplayTitle, b.Title) as Title
    FROM [ListingStoreMaster].[dbo].[acx_map_listingbdc] l
	JOIN [dbo].[glb_tbl_BDC]		b	ON l.BDC = b.BDC
	--JOIN [dbo].[tblCC_acxListing]	c	ON c.RID = l.RID
	WHERE l.RID  = @RID
	ORDER BY Title
*/
	INSERT INTO @TbleOut
	SELECT	DISTINCT
			 a.RID
	    	,b.BDC
		    ,ISNULL(b.DisplayTitle, b.Title) as Title
	FROM [dbo].[tblCC_acxBDC]		a
	JOIN [dbo].[glb_tbl_BDC]		b	ON a.BDC = b.BDC
--	JOIN [dbo].[tblCC_acxListing] c ON c.RID = a.RID
	WHERE a.RID  = @RID
	AND		a.sDBState = 'NEW' 
	AND		a.dtTurn is null
	ORDER BY Title

SELECT * FROM @TbleOut
END




GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forCourtesyListingFromLC] TO [web_user]
GO
