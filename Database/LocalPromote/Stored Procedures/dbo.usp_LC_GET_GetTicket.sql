SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_GetTicket] 
	@sHash varchar(255)
AS
BEGIN
	SET NOCOUNT ON
	SELECT 
		lMemberID
	FROM
		tblLP_PasswordTicket
	WHERE
		sHash = @sHash AND
		sActive = '1'
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_GetTicket] TO [web_user]
GO
