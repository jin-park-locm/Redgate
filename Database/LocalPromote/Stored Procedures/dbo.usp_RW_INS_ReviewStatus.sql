SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_INS_ReviewStatus]
/**********************************************************************************
Description   :  record the abuse status 

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-01-2008 dlabrie    Initial Development

EXAMPLES: 	usp_RW_INS_ReviewStatus 'kirkhamthree@yahoo.com','92614', 'KirkhamM', 2,'M','N' 
			usp_RW_INS_ReviewStatus 'shiaorong@yahoo.com','92867', 'DLaB',2, 'F', 'N'
		
**********************************************************************************/
@ReviewID	int,
	@Status		char(3) -- 'DEL' for delete and 'ABU' for abuse
as
SET NOCOUNT ON

BEGIN


	Insert into tblRW_localReviewStatus
	(lReviewID, sStatus,szUpdatedBy,dtUpdated)
	Values(@ReviewID, @Status, 'Admin', Getdate())
END


GO
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_ReviewStatus] TO [web_user]
GO
