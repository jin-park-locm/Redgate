SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_DeactivateTicket] 
	@sHash varchar(255)
AS
BEGIN
	UPDATE  
		tblLP_PasswordTicket
	SET 
		sActive = 0, 
		dTimestampModified = getDate()
	WHERE
		sHash = @sHash

-- no retun needed..
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_DeactivateTicket] TO [web_user]
GO
