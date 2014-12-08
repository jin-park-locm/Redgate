SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerByZuoraGatewayKey]
(
	@ZuoraKey VARCHAR(20)
)
AS

SELECT p.*
FROM tblLP_Partner p
INNER JOIN tblLP_PartnerSite s ON s.lPartnerID = p.lPartnerID
	AND s.sSiteType = 'PT'
INNER JOIN tblLP_PartnerSiteZuoraKey k ON k.ID = s.PartnerSiteZuoraKeyID
WHERE k.ZuoraKey = @ZuoraKey


GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerByZuoraGatewayKey] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerByZuoraGatewayKey] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerByZuoraGatewayKey] TO [web_user]
GO
