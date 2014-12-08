SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_ListingBillingEntity]@lOrderNo int    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN SELECT  obe.[lBillingEntityID]
		,be.[BillingEntityName]
		,obe.[dtUpdate]
FROM [tblLP_OrderBillingEntity] obeJOIN [tblML_BillingEntity] be ON be.[lBillingEntityID] = obe.[lBillingEntityID]WHERE obe.lOrderNo = @lOrderNoEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ListingBillingEntity] TO [web_user]
GO
