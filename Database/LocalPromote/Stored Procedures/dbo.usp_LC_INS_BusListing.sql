SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_BusListing]  
     @ListingID			uniqueidentifier	= null
SET NOCOUNT ON
   
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