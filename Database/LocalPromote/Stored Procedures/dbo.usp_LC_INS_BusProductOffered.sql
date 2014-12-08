SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusProductOffered]

@lAdvertiserID		int,	
@szProductOfferDesc	varchar(3000)

AS
SET NOCOUNT ON
DECLARE @lProductOfferID int
-- modify by MU
INSERT INTO tblLP_BusProductOffered
	(lAdvertiserID, szProductOfferDesc, sActive, szUpdatedBy,dtUpdate)
VALUES
	(@lAdvertiserID, @szProductOfferDesc, 'Y', 'UI', Getdate())

SET @lProductOfferID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT @lProductOfferID AS  lProductOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusProductOffered] TO [web_user]
GO
