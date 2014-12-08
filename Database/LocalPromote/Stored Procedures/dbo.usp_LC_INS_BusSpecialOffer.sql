SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_BusSpecialOffer]

	@lAdvertiserID		int,	
	@szDisplayURL		varchar(50),
	@szURL				varchar(300)
as

SET NOCOUNT ON
DECLARE @lOfferURLID int

INSERT INTO tblLP_BusSpecialOfferURL
(
						lAdvertiserID, 
						szDisplayURL, 
						szURL, 
						szUpdatedBy,
						dtUpdate
)
VALUES(
						@lAdvertiserID, 
						@szDisplayURL, 
						@szURL, 
						'UI', 
						Getdate()
)
SET @lOfferURLID = SCOPE_IDENTITY()
 
IF @@ERROR = 0
SELECT @lOfferURLID AS lOfferURLID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialOffer] TO [web_user]
GO
