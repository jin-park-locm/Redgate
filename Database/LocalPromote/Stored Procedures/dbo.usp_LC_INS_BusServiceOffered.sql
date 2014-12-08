SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusServiceOffered]

@lAdvertiserID		int,	
@szServiceOfferDesc	varchar(3000)

as
SET NOCOUNT ON

DECLARE @lServiceOfferID int

-- modify by MU
INSERT INTO tblLP_BusServiceOffered
	(lAdvertiserID, szServiceOfferDesc, sActive, szUpdatedBy,dtUpdate)
VALUES
	(@lAdvertiserID, @szServiceOfferDesc, 'Y', 'UI', Getdate())

SET @lServiceOfferID = SCOPE_IDENTITY()
 
IF @@ERROR = 0
SELECT @lServiceOfferID AS lServiceOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceOffered] TO [web_user]
GO
