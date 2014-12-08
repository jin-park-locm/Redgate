SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_DEL_BusTwitter]
@lAdvertiserID		int,	
@lTwitterID			int,
@szUpdatedBy		varchar(20)		= 'UI'
AS
/*
Example:	exec usp_LC_DEL_BusTwitter @lAdvertiserID = 27, @lTwitterID = 21001
*/
SET NOCOUNT ON
 
UPDATE	b
SET		sActive				= 'N', 
		szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
		dtUpdate			= Getdate()
FROM	tblLP_BusTwitter b
WHERE	lAdvertiserID = @lAdvertiserID

GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusTwitter] TO [web_user]
GO
