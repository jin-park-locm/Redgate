SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LP_GET_KeywordsByCategories] 
	@DefaultTier3s VARCHAR(MAX)

AS
/**********************************************************************************
Description   :  Lists Keywords for Tier 3 Categories

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-08-2009 rteixeira Initial Development

EXAMPLES: 	usp_LP_GET_KeywordsByCategories '24030300, 24030301' 

**********************************************************************************/
BEGIN
	SET NOCOUNT ON;

	SELECT
		DISTINCT Keyword
	FROM vwLP_KeywordBDC3 WITH(NOLOCK)
	WHERE
		DefaultTier3 IN
			(SELECT vcWord FROM glb_fn_WordTable2(@DefaultTier3s));

END
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_KeywordsByCategories] TO [web_user]
GO
