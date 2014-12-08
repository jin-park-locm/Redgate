SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Keyword_byAID] 
@lAdvertiserID int
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED


BEGIN	
	SELECT 
			szKeyword 
	FROM  tblLP_AdvertiserKeyword 
	WHERE lAdvertiserid = @lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Keyword_byAID] TO [web_user]
GO
