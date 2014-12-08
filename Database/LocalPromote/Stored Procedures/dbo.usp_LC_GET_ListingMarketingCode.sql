SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_ListingMarketingCode]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	b.sSource,
	s.szSourceDesc
FROM 
	tblLP_BusListing b
JOIN
	tblAL_Source s
ON	s.sSource = b.sSource
WHERE
	b.lAdvertiserID = @lAdvertiserID
-- AND	b.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingMarketingCode] TO [web_user]
GO
