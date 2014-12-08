SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_GET_LanguageSpoken]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	ls.lLanguageID,
	l.szLanguage,
	ls.sActive
FROM 
	tblLP_BusLanguageSpoken ls
JOIN
	tblAL_Language l
ON	l.lLanguageID = ls.lLanguageID
WHERE
    ls.lAdvertiserID = @lAdvertiserID
--AND	ls.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_LanguageSpoken] TO [web_user]
GO
