SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[Usp_LC_Get_ListingTypes]
@lSiteID			int, 
@lAdvertiserID		int
--, @sListingType		char(3)

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT distinct
sListingType 
FROM tblLP_PartnerListing
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_Get_ListingTypes] TO [web_user]
GO
