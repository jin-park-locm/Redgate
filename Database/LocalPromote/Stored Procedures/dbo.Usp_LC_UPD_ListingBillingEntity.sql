SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_ListingBillingEntity]	 @lOrderNo				int    ,@lBillingEntityID		int = NULLASSET NOCOUNT ONDECLARE @lOBEID intBEGIN    UPDATE obe    SET          [lBillingEntityID]		= ISNULL(@lBillingEntityID, [lBillingEntityID])	FROM [tblLP_OrderBillingEntity] obe	WHERE lOrderNo = @lOrderNo         IF @@ERROR = 0SELECT @lOBEID = SCOPE_IDENTITY()SELECT @lOBEID as lOBEIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingBillingEntity] TO [web_user]
GO
