SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Deactivate_LOCM_user]
@logged_in_lMemberID	int,
@lMemberID				int

AS 
SET NOCOUNT ON

DECLARE @lSecurityLevelID int

SELECT @lSecurityLevelID = lSecurityLevelID 
FROM tblLP_MemberSecurity
WHERE lMemberID = @logged_in_lMemberID
AND	  sActive = 'Y'

IF @lSecurityLevelID = 5 -- lSecurityLevelID = 5 is LOCM user...
BEGIN
	UPDATE s
		SET  s.sActive = 'N'
	FROM tblLP_MemberInfo s	WHERE s.lMemberID = @lMemberID
	AND	  sActive = 'Y' 

	IF @@ERROR = 0
	SELECT   @lMemberID	  AS lMemberID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_LOCM_user] TO [web_user]
GO
