SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Usp_LC_GET_Search_BDC_byTitle_bak]

	@Keyword VARCHAR(255)
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

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
