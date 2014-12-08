SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ResetPassword] 
	@lMemberID int,
	@szPassword varchar(50)
AS
SET NOCOUNT ON

BEGIN
	UPDATE  
		tblLP_MemberInfo
	SET 
		szPassword = @szPassword,
		dtUpdate = getdate()
	WHERE
		lMemberID = @lMemberID
END

IF @@ERROR = 0
SELECT @lMemberID AS lMemberID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ResetPassword] TO [web_user]
GO
