SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusPaymentMethod]

@lPymtTypeID int,
@lAdvertiserID int

AS
SET NOCOUNT ON
-- modify by MU
INSERT INTO tblLP_BusPaymentMethod
	(lPymtTypeID, lAdvertiserID, sActive, szUpdatedBy, dtUpdate)
VALUES
	(@lPymtTypeID, @lAdvertiserID, 'Y', 'UI',Getdate())

IF @@ERROR = 0
SELECT @lPymtTypeID		AS lPymtTypeID, 
	   @lAdvertiserID	AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusPaymentMethod] TO [web_user]
GO
