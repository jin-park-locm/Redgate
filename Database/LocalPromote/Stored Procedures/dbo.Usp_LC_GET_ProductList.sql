SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_ProductList]      ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT              [lProductID]        ,[lPartnerID]        ,[szProductName]        ,[szProductDesc]        ,[mDefaultPrice]        ,[lLevel]        ,[sTimeCode]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]        	FROM  [dbo].[tblLP_ProductList] 	WHERE lPartnerID = 0END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductList] TO [web_user]
GO
