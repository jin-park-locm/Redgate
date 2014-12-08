SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_BusListingNonProfileURL]
@lAdvertiserID int

AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON

SELECT lAdvertiserID,
szNonLPProfile
FROM tblLP_BusListingProfileURL
WHERE lAdvertiserID = @lAdvertiserID
AND sActive = 'Y'

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingNonProfileURL] TO [web_user]
GO
