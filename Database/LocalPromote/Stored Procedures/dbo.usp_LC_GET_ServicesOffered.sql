SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_ServicesOffered]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	lServiceOfferID,
	szServiceOfferDesc
FROM 
	tblLP_BusServiceOffered
WHERE
	lAdvertiserID = @lAdvertiserID 
AND sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ServicesOffered] TO [web_user]
GO
