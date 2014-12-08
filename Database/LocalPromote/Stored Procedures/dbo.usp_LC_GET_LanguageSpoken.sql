SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_LanguageSpoken]
/**********************************************************************************
Description   :   Get business payment Method

Change History

Date       Name     Description
---------- -------- ------------------------------------
unknown    Contractor    Initial Development
12/15/2009 dlabrie		Add Active as parameter - LPADMINB-889

EXAMPLES: 	usp_LC_GET_LanguageSpoken 62488, 'Y'
			usp_LC_GET_LanguageSpoken 62488, 'N'
			usp_LC_GET_LanguageSpoken 62488, null
**********************************************************************************/
@lAdvertiserID	int,
@sActive  char(1)='Y'

AS
SET NOCOUNT ON

IF @sActive is null

BEGIN

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
END

ELSE

BEGIN
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
	AND	ls.sActive = @sActive 
END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_LanguageSpoken] TO [web_user]
GO
