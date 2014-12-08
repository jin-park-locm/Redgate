SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BillingEntityTypes] 

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT DISTINCT
	 lBillingEntityID
	,BillingEntityName
FROM tblML_BillingEntity
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingEntityTypes] TO [web_user]
GO
