SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_CleanupTickets]  
 @dTimestampCreated datetime  = null
AS  
BEGIN  
 UPDATE    
  tblLP_PasswordTicket  
 SET   
  sActive = 0  
 WHERE  
  dTimestampCreated < isnull (@dTimestampCreated  , Getdate()-5)
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CleanupTickets] TO [web_user]
GO
