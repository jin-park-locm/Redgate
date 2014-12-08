SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_LC_GET_Listing_By_ID]
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

		,[AARPDisc]
        ,[ThuOpen]
ListingEnhance.[dbo].[tblTM_UploadLDACImport]
--[Listingid] = @Listingid
AND     [Reason] IS NOT NULL
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_By_ID] TO [web_user]
GO