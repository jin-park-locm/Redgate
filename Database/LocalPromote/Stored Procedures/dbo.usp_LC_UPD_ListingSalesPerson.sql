SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingSalesPerson]
	JOIN tblLP_ProductOrder p	ON	p.lSalesPersonID = s.lSalesPersonID
	JOIN tblLP_BusListing	b	ON  b.lAdvertiserID  = p.lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingSalesPerson] TO [web_user]
GO