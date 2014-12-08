SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusDiscount]

@lBusDiscountType			int,	
@lAdvertiserID			int,
@szOtherDisct			varchar(60)

AS
SET NOCOUNT ON
DECLARE @lBusDiscountID int

INSERT INTO tblLP_BusDiscount
	(lBusDiscountType, lAdvertiserID, szOtherDisct, sActive, szUpdatedBy,dtUpdate)
VALUES
	(@lBusDiscountType, @lAdvertiserID, @szOtherDisct, 'Y', 'UI', Getdate())

SET @lBusDiscountID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT @lBusDiscountID AS lBusDiscountID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDiscount] TO [web_user]
GO
