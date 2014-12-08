SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BillingTypes] 

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT
	  lBillingID
	, szBillingDesc
FROM tblAL_BillingMethod
WHERE sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BillingTypes] TO [web_user]
GO
