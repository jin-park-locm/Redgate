SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusDiscount]
@lBusDiscountID			int,
@lBusDiscountType		int = NULL,	
@lAdvertiserID			int= NULL,
@szOtherDisct			varchar(60)= NULL
, @sActive				char(1)		= 'Y'
, @szUpdatedBy			varchar(20)	= 'UI'
, @dtUpdate				datetime    = NULL
AS
SET NOCOUNT ON

-- PK lBusDiscountID

UPDATE b
	SET lBusDiscountType	= ISNULL (@lBusDiscountType, lBusDiscountType)
	,   lAdvertiserID		= ISNULL (@lAdvertiserID, lAdvertiserID)
	,   szOtherDisct		= ISNULL (@szOtherDisct, szOtherDisct)
	,	sActive				= ISNULL (@sActive, sActive)
	,	szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy)
	,	dtUpdate			= ISNULL (@dtUpdate, Getdate())
FROM tblLP_BusDiscount b
WHERE lBusDiscountID = @lBusDiscountID

IF @@ERROR = 0
SELECT @lBusDiscountID AS lBusDiscountID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDiscount] TO [web_user]
GO
