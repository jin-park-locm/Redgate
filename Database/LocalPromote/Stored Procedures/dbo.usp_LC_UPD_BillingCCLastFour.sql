SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BillingCCLastFour] 
@lAdvertiserID  int,
@sCardLast4		char(4)
AS
 
SET NOCOUNT ON

BEGIN

	UPDATE c
		SET
			sCardLast4 = @sCardLast4
	FROM tblLP_memberCCinfo c
	JOIN tblLP_BusListing   b	ON b.lMemberID = c.lMemberID
	WHERE b.lAdvertiserID = @lAdvertiserID

	IF @@ERROR =0
	SELECT @lAdvertiserID AS lAdvertiserID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BillingCCLastFour] TO [web_user]
GO
