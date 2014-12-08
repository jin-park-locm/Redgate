SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE  PROCEDURE [dbo].[usp_LC_UPD_BusListing]
/********************************************
Description   :   Update the business listing and its Descriptions

Change History

Date		Name     Description
---------- -------- ------------------------------------
2009		unknown    Initial Development
02-10-2010	dlabrie	   Add if Exist statement to check if AID is in BusDescription table
						If Yes, Update else insert.

Example:
usp_LC_UPD_BusListing 
@sztitle='kingcats and kingdogs',@szStreetName='2200 West Palmyra',
@szCity='Orange',@sState='CA',@sPostalCode='92867',@lCountryID='1',
@szPhone='7147711581',@szPhoneAlt=NULL,@szFax='',@szURL='',
@szEmail='derongoc@yahoo.com',@sHideAddress='Y',
@szBusDesc='Cat lover places and cat supplies',
@lAdvertiserID='273321'

*********************************************/
@lAdvertiserID int,
@ListingId		uniqueidentifier = null,
@lMemberID		int				 = null,
@RIDAX			int				 = null,
@sAgencyID		char(2)			 = null,		
@szTitle			varchar(250)	 = null,
@szBldgName		varchar(50)		 = null,
@szStreetName		varchar(250)	 = null,
@szUnit			varchar(20)		 = null,
@szCity			varchar(50)		 = null,
@sState			char(2)			 = null,
@sPostalCode		varchar(10)		 = null,
@sZip4			char(4)			 = null,
@lCountryId		int				 = null,
@szPhone	varchar(12)		 = null,
@szFax		varchar(12)		 = null,
@szURL			varchar(255)	 = null,
@szEmail			varchar(250)	 = null,
@sAction		char(3)			 = null,
@dtAction		datetime		 = null,
@dtListing1st	datetime		 = null,
@szUpdatedBy	varchar(50)		 = 'UI', 
@szLocationName	varchar(50)		 = null,
@sHideAddress	char(1)			 = null,
@szBusDesc	Varchar(4000)	 = null,
@szPhoneAlt varchar(12)		 =null 

AS
SET NOCOUNT ON

-- PK lAdvertiserID
 
DECLARE @ERR int
 
UPDATE b
	SET	ListingId		=	ISNULL (@ListingId ,ListingId),
		lMemberId		=	ISNULL (@lMemberID ,lMemberId ),
		RIDAX			=	ISNULL (@RIDAX ,RIDAX ),
		sAgencyID		=	ISNULL (@sAgencyID ,sAgencyID ),
		szTitle			=	ISNULL (@szTitle ,szTitle ), 
		szBldgName		=	ISNULL (@szBldgName ,szBldgName ), 
		szStreetName	=	ISNULL (@szStreetName ,szStreetName ), 
		szCity			=	ISNULL (@szCity ,szCity ), 
		sState			=	ISNULL (@sState ,sState ), 
		sPostalCode		=	ISNULL (@sPostalCode ,sPostalCode ),
		sZip4			=	ISNULL (@sZip4 ,sZip4 ),
		lCountryId		=	ISNULL (@lCountryId ,lCountryId ), 
		szPhone			=	ISNULL (@szPhone ,szPhone ), 
		szFax			=	ISNULL (@szFax ,szFax ), 
		--szPhoneAlt		=   ISNULL (@szPhoneAlt ,szPhoneAlt ),  
		szPhoneAlt		=	@szPhoneAlt, -- Changed on 12/30/2009 to allow NULL values
		szURL			=	ISNULL (@szURL ,szURL ), 
		szEmail			=	ISNULL (@szEmail ,szEmail ), 
		sAction			=	ISNULL (@sAction , 'UPD' ),
		dtAction		=	ISNULL (@dtAction ,Getdate() ),
		--dtListing1st	=	ISNULL (@dtListing1st ,Getdate() ),
		szUpdatedBy		=	ISNULL (@szUpdatedBy , 'UI'),
		szUnit			=	ISNULL (@szUnit ,szUnit ), 
		szLocationName	=	ISNULL (@szLocationName ,szLocationName ),
		sHideAddress	=	ISNULL (@sHideAddress , sHideAddress )

FROM tblLP_BusListing b
WHERE lAdvertiserID = @lAdvertiserID

SELECT @ERR = @@ERROR
-- PK lBusDescID
DECLARE @lBusDescID int

If Exists(select 1 from tblLP_BusDescription where ladvertiserid=@lAdvertiserID)

SELECT TOP 1 @lBusDescID  = lBusDescID 
FROM tblLP_BusDescription
WHERE lAdvertiserId = @lAdvertiserID
SELECT @ERR = @ERR + @@ERROR
IF @szBusDesc Is Not Null  
UPDATE b
SET lAdvertiserId = @lAdvertiserID,
	szBusDesc     = @szBusDesc,
    szUpdatedBy   = ISNULL ( @szUpdatedBy, 'UI'),
	dtUpdate	  = ISNULL ( @dtAction, Getdate())
FROM tblLP_BusDescription b
WHERE lBusDescID = @lBusDescID
SELECT @ERR = @ERR + @@ERROR

If not exists (select 1 from tblLP_BusDescription where ladvertiserid=@lAdvertiserID)
Insert into tblLP_BusDescription
(lAdvertiserid, szBusDesc, szUpdatedBy, dtUpdate)
Values (@lAdvertiserID,@szBusDesc, ISNULL ( @szUpdatedBy, 'UI'), getdate())


IF @RIDAX IS NOT NULL 
BEGIN
	UPDATE ListingStoreMaster..acx_tbl_listing
	SET Claimed = 'Y'
	WHERE RID = @RIDAX
SELECT @ERR = @ERR + @@ERROR
END

IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListing] TO [web_user]
GO
