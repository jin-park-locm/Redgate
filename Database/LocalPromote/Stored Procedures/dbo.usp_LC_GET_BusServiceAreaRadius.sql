SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BusServiceAreaRadius]
@lSiteID int

AS

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN

	SELECT lSearchMile
	FROM tblLP_PartnerSiteRadius
	WHERE lSiteID = @lSiteID 
	AND sActive = 'Y'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusServiceAreaRadius] TO [web_user]
GO
