SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BusServiceAreaRadius]
@lSiteID int = NULL,
@lSearchMile int = NULL,
@sActive char(1) = NULL,
@szUpdatedBy varchar(20) = NULL,
@dtUpdate datetime = NULL


AS
SET NOCOUNT ON

UPDATE tblLP_PartnerSiteRadius
SET
			lSiteID		= ISNULL (@lSiteID, lSiteID)
           ,lSearchMile	= ISNULL (@lSearchMile, lSearchMile)
           ,sActive		= ISNULL (@sActive, sActive)
           ,szUpdatedBy	= ISNULL (@szUpdatedBy, szUpdatedBy)
           ,dtUpdate	= ISNULL (@dtUpdate, getdate())
WHERE lSiteID = @lSiteID


IF @@ERROR = 0
SELECT @lSiteID as lSiteID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusServiceAreaRadius] TO [web_user]
GO
