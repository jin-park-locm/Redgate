SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerList]   ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN

SELECT	lPartnerID,
		szPartnerName
		
FROM	tblLP_Partner
WHERE lPartnerID <> 0
	  AND sActive = 'Y'
ORDER BY szPartnerName

END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerList] TO [web_user]
GO
