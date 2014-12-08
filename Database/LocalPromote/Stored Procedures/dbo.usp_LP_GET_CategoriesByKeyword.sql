SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LP_GET_CategoriesByKeyword] 
	@Keyword VARCHAR(255)
AS
/******************************************************************
File Name     :   usp_LP_GET_CategoriesByKeyword.sql
Description   :   Gets Tier 3 categories by Keyword
Comments   :   

Change History
Date       Name     Description
---------- -------- ------------------------------------
1-19-2007  slance   Initial Development


<example>
exec usp_LP_GET_CategoriesByKeyword 'computer'
</example>
*****************************************************************************/
BEGIN

	Declare @NormKeyword varchar(255)
	SET @NormKeyword = dbo.glb_fn_NormalizeKeyword(@Keyword,0)

	SELECT DISTINCT CategoryDesc, DefaultTier3
	FROM vwLP_KeywordBDC3
	WHERE keyword = @Keyword 
	OR	Keyword=@NormKeyword
	OR	keyword LIKE '% ' + @NormKeyword + ' %' 	
	OR	keyword LIKE  @NormKeyword + ' %' 
	OR	CategoryDesc LIKE '% ' + @NormKeyword + ' %'
	ORDER BY CategoryDesc ASC

END

GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_CategoriesByKeyword] TO [web_user]
GO
