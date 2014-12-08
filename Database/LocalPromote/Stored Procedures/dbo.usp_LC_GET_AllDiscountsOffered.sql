SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_AllDiscountsOffered]
AS

SET NOCOUNT ON

SELECT
	lBusDiscountType,
	szDiscountName
FROM 
	tblLP_BusDiscountType
ORDER BY
	lBusDiscountType
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllDiscountsOffered] TO [web_user]
GO
