SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusPaymentMethod]

@lPymtTypeID	int,
@lAdvertiserID	int,
@sActive		char(1)		= NULL, --'Y', 
@szUpdatedBy	varchar(20)	= 'UI', 
@dtUpdate		datetime	= NULL
AS
SET NOCOUNT ON

-- PK lPymtTypeID, lAdvertiserID

UPDATE b
	SET		sActive		= ISNULL (@sActive, sActive),
			szUpdatedBy	= ISNULL (@szUpdatedBy, szUpdatedBy), 
			dtUpdate	= ISNULL (@dtUpdate, Getdate()) 
FROM  tblLP_BusPaymentMethod b
WHERE lPymtTypeID = @lPymtTypeID AND lAdvertiserID = @lAdvertiserID

IF @@ERROR = 0
SELECT @lPymtTypeID AS lPymtTypeID, @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusPaymentMethod] TO [web_user]
GO
