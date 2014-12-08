SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusBrandOffered]

@lAdvertiserID		int,	
@szBrandOfferDesc	varchar(3000)

AS
SET NOCOUNT ON

DECLARE @lBrandOfferID int

-- Modify by MU
INSERT INTO tblLP_BusBrandOffered
	(lAdvertiserID, szBrandOfferDesc, sActive, szUpdatedBy,dtUpdate)
VALUES
	(@lAdvertiserID, @szBrandOfferDesc, 'Y', 'UI', Getdate())

SET @lBrandOfferID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT @lBrandOfferID AS lBrandOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusBrandOffered] TO [web_user]
GO
