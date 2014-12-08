SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_CreditcardType]

AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED


SELECT [lPCardID]
      ,[szCardName]
      ,[sActive]
      ,[szUpdatedBy]
      ,[dtUpdate]
  FROM [dbo].[tblAL_CreditCardType]
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CreditcardType] TO [web_user]
GO
