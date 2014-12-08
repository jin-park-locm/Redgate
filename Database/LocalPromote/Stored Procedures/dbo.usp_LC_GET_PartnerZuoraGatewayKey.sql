SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerZuoraGatewayKey]
(
	@PartnerID INT
)
AS

SELECT k.*
FROM tblLP_Partner p
INNER JOIN tblLP_PartnerSite s ON s.lPartnerID = p.lPartnerID
	AND s.sSiteType = 'PT'
INNER JOIN tblLP_PartnerSiteZuoraKey k ON k.ID = s.PartnerSiteZuoraKeyID
WHERE p.lPartnerID = @PartnerID



GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerZuoraGatewayKey] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerZuoraGatewayKey] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerZuoraGatewayKey] TO [web_user]
GO
