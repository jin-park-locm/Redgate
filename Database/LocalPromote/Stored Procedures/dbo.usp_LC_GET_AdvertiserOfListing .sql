SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_AdvertiserOfListing ]   
@lAdvertiserID int  
AS  
SET NOCOUNT ON  
  
  
BEGIN    
  
 SELECT DISTINCT 
	m.lMemberID,   
	m.szFirstName,   
    m.szLastName    
--   m.szMidName,   
   
 From tblLP_MemberInfo  m (nolock)  
 Join tblLP_BusListing  b (nolock)		ON b.lMemberId     = m.lMemberId  
 Join tblLP_BusListingStatus s (nolock) ON s.lAdvertiserID = b.lAdvertiserID  
  
 WHERE	b.lAdvertiserID = @lAdvertiserID AND  
		s.sLastStatus = 'Y'  
 ORDER BY  m.lMemberId  
  
  
 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserOfListing ] TO [web_user]
GO
