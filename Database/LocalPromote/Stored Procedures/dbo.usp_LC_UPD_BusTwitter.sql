SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusTwitter]
@lAdvertiserID		int,	
@lTwitterID			int,		
@szTwitterName		varchar(256)	= NULL,
@sActive			char(1)			= NULL, 
@szUpdatedBy		varchar(20)		= 'UI', 
@dtUpdate			datetime		= NULL
AS
/*
Example:	exec usp_LC_UPD_BusTwitter @lAdvertiserID = 27, @lTwitterID = 21001,
			@szTwitterName = 'Test for second update Twitter in Local.com'
*/
SET NOCOUNT ON
 
UPDATE	b
SET		szTwitterName		= ISNULL (@szTwitterName, szTwitterName),
		lTwitterID			= ISNULL (@lTwitterID, lTwitterID), 
		sActive				= ISNULL (@sActive, sActive), 
		szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
		dtUpdate			= ISNULL (@dtUpdate, Getdate())
FROM	tblLP_BusTwitter b
WHERE	lAdvertiserID = @lAdvertiserID

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusTwitter] TO [web_user]
GO
