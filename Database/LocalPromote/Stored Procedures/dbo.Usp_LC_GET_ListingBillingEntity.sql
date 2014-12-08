SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_ListingBillingEntity]
		,be.[BillingEntityName]
		,obe.[dtUpdate]
FROM [tblLP_OrderBillingEntity] obe
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [web_user]
GO