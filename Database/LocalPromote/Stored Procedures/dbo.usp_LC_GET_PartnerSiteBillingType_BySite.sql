SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSiteBillingType_BySite]
(
	@PartnerSiteID INT
)
AS

SELECT sbt.*
FROM tblLP_PartnerSite s
INNER JOIN tblLP_PartnerSiteBillingType sbt ON sbt.ID = s.PartnerSiteBillingTypeID
WHERE s.lSiteID = @PartnerSiteID



GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteBillingType_BySite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteBillingType_BySite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteBillingType_BySite] TO [web_user]
GO
