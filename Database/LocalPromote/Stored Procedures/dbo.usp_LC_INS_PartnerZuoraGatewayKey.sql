SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[usp_LC_INS_PartnerZuoraGatewayKey]
(
	 @PartnerID INT
	,@ZuoraKey VARCHAR(20)
	,@CreatedBy VARCHAR(50)
)
AS

DECLARE @PartnerSiteID INT
SELECT @PartnerSiteID = s.lSiteID
FROM tblLP_Partner p
INNER JOIN tblLP_PartnerSite s ON s.lPartnerID = p.lPartnerID
	AND s.sSiteType = 'PT'
WHERE p.lPartnerID = @PartnerID


DECLARE @ID INT
INSERT tblLP_PartnerSiteZuoraKey
(
	 PartnerSiteID
	,ZuoraKey
	,Created
	,CreatedBy
)
VALUES
( 
	 @PartnerSiteID
	,@ZuoraKey
	,GETDATE()
	,@CreatedBy
)
SELECT @ID = SCOPE_IDENTITY()


UPDATE tblLP_PartnerSite
SET PartnerSiteZuoraKeyID = @ID
WHERE lSiteID = @PartnerSiteID


GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerZuoraGatewayKey] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerZuoraGatewayKey] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerZuoraGatewayKey] TO [web_user]
GO
