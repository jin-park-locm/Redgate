SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingProductCode] 
@lAdvertiserID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN
SELECT DISTINCT
	
	p.szProductName

FROM tblLP_ProductList		 p
JOIN tblLP_PartnerSite		 s	ON	s.lPartnerID	 =	p.lPartnerID
JOIN tblLP_PartnerSiteMember m	ON  m.lSiteID		 =  s.lSiteID
JOIN tblLP_BusListing		 b	ON  b.lMemberID		 =	m.lMemberID
WHERE b.lAdvertiserID = @lAdvertiserID
AND p.sActive = 'Y'
AND s.sActive = 'Y'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingProductCode] TO [web_user]
GO
