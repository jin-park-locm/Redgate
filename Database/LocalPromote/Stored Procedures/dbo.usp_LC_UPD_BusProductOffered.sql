SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusProductOffered]
@lProductOfferID	int,
@lAdvertiserID		int				= NULL,	
@szProductOfferDesc	varchar(3000)	= NULL,
@sActive			char(1)			= NULL,  -- 'Y'
@szUpdatedBy		varchar(20)		= 'UI', 
@dtUpdate			datetime		= NULL
AS
SET NOCOUNT ON

-- PK lProductOfferID

UPDATE b
	SET lAdvertiserID		= ISNULL (@lAdvertiserID, lAdvertiserID), 
		szProductOfferDesc	= ISNULL (@szProductOfferDesc, szProductOfferDesc),  
		sActive				= ISNULL (@sActive, sActive), 
		szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
		dtUpdate			= ISNULL (@dtUpdate, Getdate())

FROM tblLP_BusProductOffered b
WHERE lProductOfferID = @lProductOfferID

IF @@ERROR = 0
SELECT @lProductOfferID AS lProductOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusProductOffered] TO [web_user]
GO
