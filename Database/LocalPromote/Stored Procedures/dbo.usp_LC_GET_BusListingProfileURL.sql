SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BusListingProfileURL]
@lAdvertiserID int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT [szProfileURL]
FROM [tblLP_BusListingProfileURL]
WHERE [lAdvertiserID] = @lAdvertiserID
AND   [sActive]		  = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusListingProfileURL] TO [web_user]
GO
