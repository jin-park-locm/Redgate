SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[usp_LC_GET_Account_Detail]
@lMemberID int	 
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT
			lMemberID, 
			szpassword, 
			szLastName, 
			szFirstName,
			szLoginName, 
			dtUpdate,
			sActive
FROM tblLP_MemberInfo
WHERE lMemberID = @lMemberID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Account_Detail] TO [web_user]
GO
