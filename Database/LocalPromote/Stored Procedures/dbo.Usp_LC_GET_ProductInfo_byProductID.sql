SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_ProductInfo_byProductID]     @lProductID  int     ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT              [lProductID]        ,[lPartnerID]        ,[szProductName]        ,[szProductDesc]        ,[mDefaultPrice]        ,[lLevel]        ,[sTimeCode]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]        	FROM  [dbo].[tblLP_ProductList] 	WHERE [lProductID] = @lProductIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductInfo_byProductID] TO [web_user]
GO
