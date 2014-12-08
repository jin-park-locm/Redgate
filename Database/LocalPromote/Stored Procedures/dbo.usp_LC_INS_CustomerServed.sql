SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_CustomerServed]

@lAdvertiserID int,
@lServiceTypeID int

AS

SET NOCOUNT ON
--modify by MU
INSERT INTO   tblLP_BusCustomerServed
	(lAdvertiserID, lServiceTypeID, sActive, szUpdatedBy, dtUpdate)
VALUES 
	(@lAdvertiserID, @lServiceTypeID, 'Y', 'UI', Getdate())

IF @@ERROR = 0
SELECT @lServiceTypeID, @lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CustomerServed] TO [web_user]
GO
