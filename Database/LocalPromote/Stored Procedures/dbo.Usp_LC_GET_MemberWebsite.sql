SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_MemberWebsite]@lMemberID intAS   SET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSELECT 	lMemberid       ,szWebURL      ,sActive      ,szUpdatedBy       ,dtUpdate   FROM [tblLP_MemberWebsite]WHERE lMemberid = @lMemberID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberWebsite] TO [web_user]
GO
