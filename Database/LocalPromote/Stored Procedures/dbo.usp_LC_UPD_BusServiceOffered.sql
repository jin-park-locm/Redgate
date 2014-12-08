SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusServiceOffered]
@lServiceOfferID	int,
@lAdvertiserID		int				= NULL,	
@szServiceOfferDesc	varchar(3000)	= NULL,  
@sActive			char(1)			= NULL,  -- 'Y'
@szUpdatedBy		varchar(20)		= 'UI', 
@dtUpdate			datetime		= NULL
as
SET NOCOUNT ON

-- PK lServiceOfferID

UPDATE b
	SET		lAdvertiserID		= ISNULL (@lAdvertiserID, lAdvertiserID),
			szServiceOfferDesc	= ISNULL (@szServiceOfferDesc, szServiceOfferDesc),
			sActive				= ISNULL (@sActive, sActive), 
			szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
			dtUpdate			= ISNULL (@dtUpdate, Getdate())
FROM tblLP_BusServiceOffered b
WHERE lServiceOfferID = @lServiceOfferID

IF @@ERROR = 0
SELECT @lServiceOfferID AS lServiceOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceOffered] TO [web_user]
GO
