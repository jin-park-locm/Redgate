SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusListingContent]

@lAdvertiserID		int,
@szTagline			varchar(170)		= null,
@szReturnPolicy		varchar(200)	= null,
@lLocationTotal		int				= null,
@lEmployeeTotal		int				= null,
@szYearEstablished	varchar(4)		= null,
@sFemale			char(1)			= null,
@sMinority			char(1)			= null,
@sEmergency			char(1)			= null,
@szAward			varchar(300)	= null,
@szCertification	varchar(180)	= null,
@szUpdatedBy		Varchar(20)		= 'UI'

AS
SET NOCOUNT ON

-- PK lAdvertiserID

UPDATE b
SET lAdvertiserID		= ISNULL (@lAdvertiserID, lAdvertiserID), 
	szTagLine			= ISNULL (@szTagline, szTagLine ), 
	szReturnPolicy		= ISNULL (@szReturnPolicy, szReturnPolicy ), 
	lLocationTotal		= ISNULL (@lLocationTotal, lLocationTotal ), 
	lEmployeeTotal		= ISNULL (@lEmployeeTotal, lEmployeeTotal ), 
	szYearEstablished	= ISNULL (@szYearEstablished, szYearEstablished ), 
	sFemale				= ISNULL (@sFemale, sFemale), 
	sMinority			= ISNULL (@sMinority, sMinority), 
	sEmergency			= ISNULL (@sEmergency, sEmergency ), 
	szAward				= ISNULL (@szAward, szAward), 
	szCertification		= ISNULL (@szCertification, szCertification), 
	szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy ), 
	dtUpdate			= Getdate()
FROM tblLP_BusListingContent b
WHERE lAdvertiserID = @lAdvertiserID
  
IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingContent] TO [web_user]
GO
