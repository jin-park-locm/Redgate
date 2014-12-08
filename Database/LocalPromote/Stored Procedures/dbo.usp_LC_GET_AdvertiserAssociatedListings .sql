SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] 
@lMemberID int
AS
SET NOCOUNT ON


BEGIN	 

	SELECT	DISTINCT 
			b.lAdvertiserID, 
			b.sztitle
	From tblLP_BusListing		b (nolock) 
	Join tblLP_BusListingStatus	s (nolock) On s.lAdvertiserID = b.lAdvertiserID
 
	WHERE b.lMemberId = @lMemberID AND
		  s.sLastStatus = 'Y'
	Order By  b.sztitle

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AdvertiserAssociatedListings ] TO [web_user]
GO
