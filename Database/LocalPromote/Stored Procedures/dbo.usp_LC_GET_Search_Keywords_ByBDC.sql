SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Search_Keywords_ByBDC]
	@BDC int
AS
 
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON;

SELECT
DISTINCT Keyword
FROM vwLP_KeywordBDC3  
WHERE
DefaultTier3 = @BDC
--DefaultTier3 IN
--	(SELECT vcWord FROM glb_fn_WordTable2(@DefaultTier3s));
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Keywords_ByBDC] TO [web_user]
GO
