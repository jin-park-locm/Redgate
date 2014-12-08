SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BusProductOffered]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	lProductOfferID,
    szProductOfferDesc
FROM 
	tblLP_BusProductOffered
WHERE
	lAdvertiserID = @lAdvertiserID
AND	sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusProductOffered] TO [web_user]
GO
