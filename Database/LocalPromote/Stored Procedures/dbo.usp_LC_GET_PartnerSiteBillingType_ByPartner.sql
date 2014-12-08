SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSiteBillingType_ByPartner]
(
	@PartnerID INT
)
AS

SELECT sbt.*
FROM tblLP_Partner p
INNER JOIN tblLP_PartnerSite s ON s.lPartnerID = p.lPartnerID
	AND s.sSiteType = 'PT'
INNER JOIN tblLP_PartnerSiteBillingType sbt ON sbt.ID = s.PartnerSiteBillingTypeID
WHERE p.lPartnerID = @PartnerID



GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteBillingType_ByPartner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteBillingType_ByPartner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteBillingType_ByPartner] TO [web_user]
GO
