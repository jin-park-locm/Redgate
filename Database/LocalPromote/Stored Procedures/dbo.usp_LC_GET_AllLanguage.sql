SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_AllLanguage]
AS

SET NOCOUNT ON

SELECT
	lLanguageID,
	szLanguage
FROM 
	tblAl_Language
ORDER BY
	szLanguage
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllLanguage] TO [web_user]
GO
