SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_CreateTicket] 
	@lMemberID int,
	@sHash varchar(255),
	@szLoginEmail varchar(255)
AS
BEGIN
	INSERT INTO [dbo].[tblLP_PasswordTicket](
		lMemberID, 
		dTimestampCreated, 
		sHash, 
		sData, 
		sActive)
	VALUES (
		@lMemberID, 
		getDate(), 
		@sHash, 
		@szLoginEmail, 
		1)

IF @@ERROR = 0
SELECT @lMemberID AS lMemberID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CreateTicket] TO [web_user]
GO
