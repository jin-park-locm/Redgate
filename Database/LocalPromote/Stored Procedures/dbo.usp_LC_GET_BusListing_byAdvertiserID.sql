SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BusListing_byAdvertiserID]  
  
 @lAdvertiserID int  
  
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

 Select   
  l.lAdvertiserID,  
  p.lSiteID,  
  p.sListingType ,
  ListingID,   
  lMemberID,   
  szTitle,   
  szBldgName,   
  szStreetName,   
  szCity,   
  sState,   
  szUnit,   
  sPostalCode,   
  szLocationName,   
  lCountryID,   
  szPhone,   
  szFax,   
  szPhoneAlt,   
  szURL,   
  szEmail,   
  szBusDesc,  
  Case Upper(sHideAddress)  
   When 'Y' then 1  
   Else 0  
  End as sHideAddress,
  l.RIDAX
 From tblLP_BusListing l (nolock)  
 Left Outer Join tblLP_BusDescription d (nolock)  
 On l.lAdvertiserId = d.lAdvertiserId  
 Left Outer Join tblLP_PartnerListing p (nolock)  
    On l.lAdvertiserid = p.lAdvertiserid  
 Where l.lAdvertiserId = @lAdvertiserID  
  and p.sActive='Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListing_byAdvertiserID] TO [web_user]
GO
