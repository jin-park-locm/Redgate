SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LP_GET_Category_forListing]  
				@lAdvertiserID  int
AS  

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED  
SET NOCOUNT ON  

SELECT DISTINCT
		b.BDC, 
		b.sPrimary,
		Isnull(g.displayTitle, g.Title) as Title,
		g.DisplayTitle,
		b.sAction,
		case when b.sPrimary = 'Y' then 0
		when b.sPrimary = 'N' then 1
		else 2 end as seq
FROM	tblLP_BusListingCat b  
JOIN	glb_tbl_BDC         g ON g.BDC = b.BDC
WHERE   b.lAdvertiserID = @lAdvertiserID
order	by seq

GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_Category_forListing] TO [web_user]
GO
