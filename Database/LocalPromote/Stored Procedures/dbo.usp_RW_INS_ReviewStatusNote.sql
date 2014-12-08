SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_INS_ReviewStatusNote]
/**********************************************************************************
Description   :  record the note for a specific status 

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-01-2008 dlabrie    Initial Development

EXAMPLES: 	usp_RW_INS_ReviewStatusNote 'kirkhamthree@yahoo.com','92614', 'KirkhamM', 2,'M','N' 
			usp_RW_INS_ReviewStatusNote 'shiaorong@yahoo.com','92867', 'DLaB',2, 'F', 'N'
		
		
**********************************************************************************/

	@StatusID	int,
	@Note varchar(500)
as
SET NOCOUNT ON

BEGIN


	Insert into tblRW_localReviewStatusNote
	(lStatusID, szStatusNote,szUpdatedBy,dtUpdate)
	Values(@StatusID, @Note, 'Admin', Getdate())
END


GO
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatusNote] TO [web_user]
GO
