SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Notes_for_Campaign]	 @lCIDNo			int      ASSET NOCOUNT ONDECLARE      @lNoteID			int    BEGIN	SELECT TOP 3         n.[sNote]        ,m.[szLoginName]		,n.[dTimestamp]	FROM  [dbo].[tblLP_Notes]		n	JOIN  [dbo].[tblLP_MemberInfo]  m	ON m.lMemberID = n.lMemberID	WHERE lCIDNo = @lCIDNo 	ORDER BY n.[dTimestamp] DESCEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Notes_for_Campaign] TO [web_user]
GO
