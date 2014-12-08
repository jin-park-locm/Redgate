SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_LC_INS_BusTwitter]  
  
@lAdvertiserID  int,  
@lTwitterID int, 
@szTwitterName varchar(256)  
  
AS  

-- exec usp_LC_INS_BusTwitter 27, 21001, 'Test for first Twitter in Local.com'
BEGIN

SET NOCOUNT ON  
DECLARE @lTableKey int  

if not exists (select * FROM tblLP_BusTwitter where lAdvertiserID = @lAdvertiserID)
	Begin 
		INSERT	INTO tblLP_BusTwitter  
				([lAdvertiserID], [lTwitterID], [szTwitterName], [sActive], [szUpdatedBy], [dtUpdate])
		  
		VALUES	(@lAdvertiserID, @lTwitterID, @szTwitterName, 'Y', 'UI', Getdate())  
		  
		SET @lTableKey = SCOPE_IDENTITY()  
	End
Else
	Begin
		UPDATE	b
		SET		sActive	= 'Y', szTwitterName = @szTwitterName, lTwitterID = @lTwitterID, szUpdatedBy = 'UI', dtUpdate = Getdate()
		FROM	tblLP_BusTwitter b
		WHERE	lAdvertiserID = @lAdvertiserID

		SELECT @lTableKey = lTableKey FROM tblLP_BusTwitter WHERE	lAdvertiserID = @lAdvertiserID
	End
  
IF @@ERROR = 0  
SELECT @lTableKey AS lTableKey  

END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusTwitter] TO [web_user]
GO
