SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_BusListing]  
     @ListingID			uniqueidentifier	= null    ,@lMemberID			int    ,@RIDAX				int					= null    ,@sAgencyID			char(2)				= null    ,@sztitle			varchar(150)		     ,@szBldgName		varchar(50)			= null    ,@szStreetName		varchar(100)		= null    ,@szUnit			varchar(25)			= null    ,@szCity			varchar(50)			     ,@sState			char(2)				     ,@sPostalCode		varchar(10)			= null    ,@sZip4				char(4)				= null    ,@lCountryID		int					     ,@szLocationName	varchar(50)			= null    ,@szPhone			varchar(12)			= null    ,@szFax				varchar(12)			= null    ,@szPhoneAlt		varchar(12)			= null    ,@szURL				varchar(300)		= null    ,@szEmail			varchar(250)    ,@sHideAddress		char(1)    ,@sAction			char(3)				= 'Add'    ,@dtAction			datetime			= NULL		    ,@sSource			char(3)    ,@dtListing1st		datetime			= NULL    ,@szUpdatedBy		varchar(50)			= 'UI'    ,@ZipCity			varchar(50)    ,@szTitleSearch		varchar(150)    ,@szTitleStrip		varchar(150)    ,@szBusDesc			Varchar(4000)		= NULL    ,@RID				int					= NULLAS
SET NOCOUNT ON DECLARE @lAdvertiserID int  BEGIN    INSERT INTO [dbo].[tblLP_BusListing]    (          [ListingID]        ,[lMemberID]        ,[RIDAX]        ,[sAgencyID]        ,[sztitle]        ,[szBldgName]        ,[szStreetName]        ,[szUnit]        ,[szCity]        ,[sState]        ,[sPostalCode]        ,[sZip4]        ,[lCountryID]        ,[szLocationName]        ,[szPhone]        ,[szFax]        ,[szPhoneAlt]        ,[szURL]        ,[szEmail]        ,[sHideAddress]        ,[sAction]        ,[dtAction]        ,[sSource]        ,[dtListing1st]        ,[szUpdatedBy]        ,[ZipCity]        ,[szTitleSearch]        ,[szTitleStrip]            )    VALUES    (         @ListingID        ,@lMemberID        ,@RIDAX        ,@sAgencyID        ,@sztitle        ,@szBldgName        ,@szStreetName        ,@szUnit        ,@szCity        ,@sState        ,@sPostalCode        ,@sZip4        ,@lCountryID        ,@szLocationName        ,@szPhone        ,@szFax        ,@szPhoneAlt        ,@szURL        ,@szEmail        ,@sHideAddress        ,@sAction        ,ISNULL(@dtAction,Getdate())        ,@sSource        ,ISNULL(@dtListing1st,Getdate())        ,@szUpdatedBy        ,@ZipCity        ,case when @szTitleSearch not like '%|%' then convert(varchar(150),dbo.glb_fn_NormalizeListingTitle(@sztitle)) else @szTitleSearch end        ,case when @szTitleStrip not like '%|%' then convert(varchar(150),dbo.ufn_StrippingTitle(@sztitle)) else @szTitleStrip end            )
   
 SET @lAdvertiserID = SCOPE_IDENTITY()  
 END

 IF @szBusDesc Is Not Null and @lAdvertiserID Is Not Null  
  INSERT INTO  tblLP_BusDescription   
   (  
   lAdvertiserId,  
   szBusDesc,  
   szUpdatedBy,  
   dtUpdate  
   )  
  VALUES  
   (  
   @lAdvertiserID,  
   @szBusDesc,  
   'UI',  
   getdate()  
   )  
  
 IF @RID IS NOT NULL   
 BEGIN  
  UPDATE ListingStoreMaster..acx_tbl_listing  
  SET Claimed = 'Y'  
  WHERE RID = @RID 
 END 
  
IF @@ERROR = 0  
SELECT @lAdvertiserID AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListing] TO [web_user]
GO
