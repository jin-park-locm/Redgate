SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_BusServiceAreaRadius]
@lSiteID int,
@lSearchMile int


AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

INSERT INTO tblLP_PartnerSiteRadius
(
			lSiteID
           ,lSearchMile
           ,sActive
           ,szUpdatedBy
           ,dtUpdate
)
     VALUES
(
			@lSiteID
           ,@lSearchMile
           ,'Y'
           ,'UI'
           ,getdate()
)

IF @@ERROR = 0
SELECT @lSiteID as lSiteID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusServiceAreaRadius] TO [web_user]
GO
