SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_Listings_with_DeletionRequest]
/**********************************************************************************
Description   :		Get Deleted listing for approval 
					
Change History

Date       Name     Description
---------- -------- ------------------------------------
Unknown		Contractor  initial development
12-05-2009 dlabrie   remover acx_tbl_Listing and add Left join of the note table

EXAMPLES: 	usp_LC_GET_Listings_with_DeletionRequest 

		
**********************************************************************************/

AS
SET NOCOUNT ON

BEGIN

SELECT l.lCCListingID
      ,l.RID
      ,l.lAdvertiserID
      ,l.sAgencyID
      ,l.szTitle
      ,szAddress
      ,l.szCity
      ,l.sState
      ,szZip
      ,l.szPhone
      ,l.szURL
      ,sHideAddr
      ,l.sAction
      ,sConfirm
      ,sUpdate
      ,l.dtAdd
      ,dtTurn
	  ,ln.lCCNoteID
	  ,ln.szNote
	  ,ln.szUpdatedby
	  ,ln.sActive
	  ,m.lMemberID
	  ,m.szFirstName
	  ,m.szLastName
	  ,b.sztitle
	  ,bs.sStatus
	  ,bs.sLastStatus
	  ,p.lPartnerID
	  ,p.szPartnerName
	  ,ps.lSiteID
	  ,ps.szSiteName
FROM	tblCC_acxListing l
Left JOIN tblCC_acxListingNote ln ON l.lCCListingID = ln.lCCListingID
left JOIN tblLP_BusListing b ON l.lAdvertiserID = b.lAdvertiserID
left JOIN tblLP_MemberInfo m ON b.lMemberID = m.lMemberID
left JOIN tblLP_BusListingStatus bs ON bs.lAdvertiserID = b.lAdvertiserID AND	bs.sLastStatus = 'Y'
left JOIN tblLP_PartnerSiteMember psm ON psm.lMemberID = ln.szUpdatedby
left JOIN tblLP_PartnerSite ps ON ps.lSiteID = psm.lSiteID
left JOIN tblLP_Partner p ON p.lPartnerID = ps.lPartnerID
WHERE	l.sAction = 'DEL'
AND		l.sConfirm = 'N'
AND		(ln.sActive <> 'R' OR ln.sActive IS NULL)
ORDER BY l.dtAdd


	
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_with_DeletionRequest] TO [web_user]
GO
