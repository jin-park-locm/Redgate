SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Check_Partner_Active]
@lPartnerID int,
@lSiteID	int
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
IF @lPartnerID IS NOT NULL
SELECT 
p.lPartnerID,
p.szPartnerName,
p.szPartnerLogoPath,
p.sContactPhone,
p.szPartnerEmail,
p.szSSURL,
p.szWebSite,
p.sActive,
p.szUpdatedBy,
p.dtUpdate
FROM tblLP_Partner p
JOIN tblLP_PartnerSite ps ON ps.lPartnerID = p.lPartnerID
WHERE 
p.sActive = 'y'
AND 
(
	(p.lPartnerID  = @lPartnerID)
	OR 
	(ps.lSiteID	 = @lSiteID)
)
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_Partner_Active] TO [web_user]
GO
