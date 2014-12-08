SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BusSpecialOffer]
	@lOfferURLID		int,
	@lAdvertiserID		int,	
	@szDisplayURL		varchar(50),
	@szURL				varchar(300),
	@szUpdatedBy		varchar(20)
as

SET NOCOUNT ON

UPDATE b
SET
	lAdvertiserID	= ISNULL(@lAdvertiserID, lAdvertiserID), 
	szDisplayURL	= ISNULL(@szDisplayURL, szDisplayURL), 
	szURL			= ISNULL(@szURL, szURL), 
	szUpdatedBy		= ISNULL(@szUpdatedBy, szUpdatedBy),
	dtUpdate		= Getdate()

FROM tblLP_BusSpecialOfferURL b
WHERE lAdvertiserID = @lAdvertiserID
AND lOfferURLID = @lOfferURLID


 
IF @@ERROR = 0
SET @lOfferURLID = SCOPE_IDENTITY()
SELECT @lOfferURLID AS lOfferURLID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialOffer] TO [web_user]
GO
