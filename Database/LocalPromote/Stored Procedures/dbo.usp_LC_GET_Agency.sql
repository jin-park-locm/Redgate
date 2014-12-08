SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_Agency] @lAdvertiserID int    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN

SELECT DISTINCT
		 b.sAgencyID
		,b.sSource
		,b.lAdvertiserID
		,s.szSourceDesc
FROM tblLP_BusListing b
JOIN  tblAL_Source s ON b.sSource = s.sSource  
WHERE b.lAdvertiserID = @lAdvertiserID

END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Agency] TO [web_user]
GO
