SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create PROCEDURE [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl]
--@listingType char(10)

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT l.[lCCListingID]
      ,l.[RID]
      ,l.[lAdvertiserID]
      ,l.[sAgencyID]
      ,l.[szTitle]
      ,[szAddress]
      ,l.[szCity]
      ,l.[sState]
      ,[szZip]
      ,l.[szPhone]
      ,l.[szURL]
      ,[sHideAddr]
      ,l.[sAction]
      ,[sConfirm]
      ,[sUpdate]
      ,l.[dtAdd]
      ,[dtTurn]
	  ,ln.[lCCNoteID]
	  ,ln.[szNote]
	  ,ln.[szUpdatedby]
	  ,ln.[sActive]
	  ,m.[lMemberID]
	  ,m.[szFirstName]
	  ,m.[szLastName]
	  ,b.[sztitle]
	  ,bs.[sStatus]
	  ,bs.[sLastStatus]
	  ,p.[lPartnerID]
	  ,p.[szPartnerName]
	  ,ps.[lSiteID]
	  ,ps.[szSiteName]
FROM [tblCC_acxListing] l
Left JOIN [tblCC_acxListingNote] ln ON l.[lCCListingID] = ln.[lCCListingID]
left JOIN [ListingStoreMaster].[dbo].[acx_tbl_listing] cl ON l.[RID] = cl.[RID]
left JOIN [tblLP_BusListing] b ON l.[lAdvertiserID] = b.[lAdvertiserID]
left JOIN [tblLP_MemberInfo] m ON b.[lMemberID] = m.[lMemberID]
left JOIN [tblLP_BusListingStatus] bs ON bs.[lAdvertiserID] = b.[lAdvertiserID] AND	bs.[sLastStatus] = 'Y'
left JOIN [tblLP_PartnerSiteMember] psm ON psm.[lMemberID] = ln.[szUpdatedby]
left JOIN [tblLP_PartnerSite] ps ON ps.[lSiteID] = psm.[lSiteID]
left JOIN [tblLP_Partner] p ON p.[lPartnerID] = ps.[lPartnerID]
WHERE	l.[sAction] = 'DEL'
AND		l.[sConfirm] = 'N'
--AND		bs.[sLastStatus] = 'Y'
AND		(ln.sActive <> 'R' OR ln.sActive IS NULL)
ORDER BY l.[dtAdd]
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest_dl] TO [web_user]
GO
