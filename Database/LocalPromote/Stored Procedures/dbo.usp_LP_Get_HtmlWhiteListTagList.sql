SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LP_Get_HtmlWhiteListTagList]
/**********************************************************************************
Description   :   Get all White-listed HTML tags

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-21-2008 RT    	Initial Development

EXAMPLES: 		exec usp_LP_Get_HtmlWhiteListTagList
**********************************************************************************/
AS
BEGIN

	SET NOCOUNT ON;

	SELECT
		lHtmlWhiteListTagID
		, bSelfClosing
		, szTagName
	FROM tblLP_HtmlWhiteListTag WITH(NOLOCK);

END;
GO
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_HtmlWhiteListTagList] TO [web_user]
GO
