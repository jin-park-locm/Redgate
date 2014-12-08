SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LC_GET_AllAgencies]    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN

SELECT DISTINCT
		sSource,
		szSourceDesc
FROM tblAL_Source 
WHERE sActive = 'Y'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllAgencies] TO [web_user]
GO
