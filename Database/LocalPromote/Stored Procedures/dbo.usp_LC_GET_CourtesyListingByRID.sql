SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_CourtesyListingByRID]
@lCCListingID 	int = NULL,
@RID			int = NULL

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

IF @lCCListingID IS NOT NULL
 BEGIN
	SELECT
         [lCCListingID]        ,[RID]        ,[lAdvertiserID]        ,[sAgencyID]        ,[szTitle]        ,[szTitleOrig]        ,[szAddress]        ,[szAddressOrig]        ,[szCity]        ,[szCityOrig]        ,[sState]        ,[sStateOrig]        ,[szZip]        ,[szZipOrig]        ,[szPhone]        ,[szPhoneOrig]        ,[szURL]        ,[szURLOrig]        ,[sHideAddr]        ,[sAction]        ,[sConfirm]        ,[sUpdate]        ,[dtAdd]        ,[dtTurn]
	FROM  tblCC_acxListing
	WHERE lCCListingID = @lCCListingID
 END
ELSE
 BEGIN
	SELECT	RID, 
			Advertiserid as lAdvertiserID, 
			Agencyid as sAgencyID, 
			Title as szTitle, 
			Address as szStreetName, 
			City as szCity, 
			State as sState, 
			Zipcode as sPostalCode, 
			Phonenumber as szPhone, 
			URL as szURL, 
			AllFlag
	FROM	ListingStoreMaster..acx_tbl_Listing
	WHERE	RID=@RID
 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_CourtesyListingByRID] TO [web_user]
GO
