SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BrandsOffered]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	lBrandOfferID,
    szBrandOfferDesc
FROM 
	tblLP_BusBrandOffered
WHERE
	lAdvertiserID = @lAdvertiserID 
AND sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BrandsOffered] TO [web_user]
GO
