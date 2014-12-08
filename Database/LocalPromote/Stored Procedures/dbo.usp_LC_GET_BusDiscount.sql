SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BusDiscount]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	d.lBusDiscountID,
	d.lBusDiscountType,
	dt.szDiscountName,
	d.szOtherDisct
FROM 
	tblLP_BusDiscount d
JOIN 
	tblLP_BusDiscountType dt 
ON	dt.lBusDiscountType = d.lBusDiscountType
WHERE
	d.lAdvertiserID = @lAdvertiserID
AND	d.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDiscount] TO [web_user]
GO
