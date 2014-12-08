SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSiteDirectoryURL]@lSiteID int     AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSET NOCOUNT ON BEGIN    SELECT         [szSiteDirectoryURL]	FROM [tblLP_PartnerSiteDirectoryURL]	WHERE lSiteID = @lSiteID    END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSiteDirectoryURL] TO [web_user]
GO
