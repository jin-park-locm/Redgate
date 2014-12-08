SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Check_Member_Active] 
@lMemberID int
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
BEGIN	 

	SELECT	 m.lMemberId, sActive 
	From  tblLP_MemberInfo		m (nolock) 
	WHERE m.lMemberId = @lMemberID
 

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Member_Active] TO [web_user]
GO
