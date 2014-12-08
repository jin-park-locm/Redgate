SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_SalesPerson]
AS
SET NOCOUNT ON

SELECT [lSalesPersonID]
      ,[szFirstName]
      ,[szLastName]
      ,[szFullName]
      ,[sActive]
      ,[szUpdatedBy]
      ,[dtUpdate]
      ,[LongID]
  FROM [tblLP_SalesPerson]
  WHERE sDisplay = 'Y'
  AND sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_SalesPerson] TO [web_user]
GO
