SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_BillingMethod]  ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN	SELECT DISTINCT 	  lBillingID	, szBillingDesc 	FROM tblAL_BillingMethodEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BillingMethod] TO [web_user]
GO
