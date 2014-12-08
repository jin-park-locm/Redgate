SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Advertiser_byListingID]
@lAdvertiserID int 
as

SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

SELECT  
  m.lMemberID
, m.szLoginEmail
, m.szPassword
, m.sUserType
, m.szLastName
, m.szMidName
, m.szFirstName
, m.sTermsAccepted
, m.sActive
, m.dtUpdate
, m.szLoginName

, mp.szPhone
,  a.szStreeName
,  a.szUnit
,  a.szCity
,  a.sState
,  a.sPostalCode
,  e.szEmail
 

FROM tblLP_BusListing b 
join tblLP_MemberInfo m			on m.lMemberID = b.lMemberID
join tblLP_MemberPhone mp		on mp.lMemberID = m.lMemberID
join tblLP_MemberAddress a		on  a.lMemberID = m.lMemberID
join tblLP_MemberEmail e		on  e.lMemberID = m.lMemberID
WHERE b.lAdvertiserID = @lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser_byListingID] TO [web_user]
GO
