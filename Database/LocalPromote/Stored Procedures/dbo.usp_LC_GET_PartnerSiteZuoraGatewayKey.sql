SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSiteZuoraGatewayKey]
(
	@PartnerSiteID INT
)
AS

SELECT k.*
FROM tblLP_PartnerSite s
INNER JOIN tblLP_PartnerSiteZuoraKey k ON k.ID = s.PartnerSiteZuoraKeyID
WHERE s.lSiteID = @PartnerSiteID



GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteZuoraGatewayKey] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteZuoraGatewayKey] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteZuoraGatewayKey] TO [web_user]
GO
