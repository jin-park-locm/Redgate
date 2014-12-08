SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[Usp_LC_GET_BusSpecialOffer]

	@lAdvertiserID		int 
as
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT 
lAdvertiserID,
lOfferURLID, 
szDisplayURL, 
szURL
FROM tblLP_BusSpecialOfferURL
WHERE lAdvertiserID = @lAdvertiserID
and sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusSpecialOffer] TO [web_user]
GO
