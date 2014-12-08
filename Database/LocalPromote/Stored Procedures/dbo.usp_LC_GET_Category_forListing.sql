SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Category_forListing]  
@lAdvertiserID  int  
AS  
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED  
SET NOCOUNT ON  
  

SELECT DISTINCT
		b.BDC, 
		-- g.Title,
		--Isnull(g.displayTitle, g.Title) as Title,
		Case when g.displayTitle='Car Dealer' then g.title
			 When g.displayTitle is null then g.title
			 When g.displaytitle is not null then g.displaytitle
		END as Title,
		g.DisplayTitle,
		b.sAction
FROM tblLP_BusListingCat b  
JOIN glb_tbl_BDC         g ON g.BDC = b.BDC
WHERE   b.lAdvertiserID = @lAdvertiserID

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Category_forListing] TO [web_user]
GO
