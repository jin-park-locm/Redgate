SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE   PROCEDURE [dbo].[usp_LC_INS_MemberInfo]
	@szLoginEmail		varchar(100),
	@szPassword			varchar(50),
	@sUserType			char(2),
	@szLastName			varchar(50),
	@szMidName			varchar(50) = NULL,
	@szFirstName		varchar(50),
	@sTermsAccepted		char(1),
	@sActive			char(1) = 'Y',
--	@dtUpdate			datetime,
	@szLoginName		varchar(50),
	@dtStart			datetime = NULL

as
SET NOCOUNT ON

DECLARE @lMemberID int
BEGIN

		Insert Into tblLP_MemberInfo (
										szLoginEmail, szPassword, sUserType, 
										szLastName, szMidName, szFirstName, sTermsAccepted, 
										sActive, dtUpdate,szLoginName, dtStart
									 )
		Values (@szLoginEmail, @szPassword, @sUserType, @szLastName, @szMidName,
				@szFirstName, @sTermsAccepted, @sActive, getdate(), @szLoginName, getdate())  
		IF @@ERROR = 0
		BEGIN
		SELECT @lMemberID = SCOPE_IDENTITY()	
		SELECT @lMemberID 	AS lMemberID
		END

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MemberInfo] TO [web_user]
GO
