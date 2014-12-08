SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BusBrandOffered]
@lBrandOfferID		int,
@lAdvertiserID		int				= NULL,	
@szBrandOfferDesc	varchar(3000)	= NULL
, @sActive			char(1)			= 'Y'
, @szUpdatedBy		varchar(20)		= 'UI'
, @dtUpdate			datetime		= NULL

AS
SET NOCOUNT ON

-- PK lBrandOfferID

UPDATE b
SET
  lAdvertiserID			= ISNULL (@lAdvertiserID, lAdvertiserID)
, szBrandOfferDesc		= ISNULL (@szBrandOfferDesc, szBrandOfferDesc)
,	sActive				= ISNULL (@sActive, sActive)
,	szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy)
,	dtUpdate			= ISNULL (@dtUpdate, Getdate())
FROM tblLP_BusBrandOffered b
WHERE lBrandOfferID = @lBrandOfferID

IF @@ERROR = 0
SELECT  @lBrandOfferID AS lBrandOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusBrandOffered] TO [web_user]
GO
