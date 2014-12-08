SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_FindUser]
	@szLoginEmail varchar(255),
	@szLoginName varchar(50)
AS
BEGIN
	SET NOCOUNT ON
	IF @szLoginEmail != ''
		BEGIN
			SELECT 
				lMemberID,
				szLoginEmail
			FROM
				tblLP_MemberInfo
			WHERE
				szLoginEmail = @szLoginEmail
		END
	ELSE
		BEGIN
			SELECT 
				lMemberID,
				szLoginEmail
			FROM
				tblLP_MemberInfo
			WHERE
				szLoginName = @szLoginName
		END
	RETURN
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_FindUser] TO [web_user]
GO
