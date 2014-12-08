SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_UPD_ReviewActiveStatus]
/**********************************************************************************
Description   :  Deactive a review

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-01-2008 dlabrie    Initial Development

EXAMPLES: 	usp_RW_UPD_ReviewActiveStatus 'kirkhamthree@yahoo.com','92614', 'KirkhamM', 2,'M','N' 
			usp_RW_UPD_ReviewActiveStatus 'shiaorong@yahoo.com','92867', 'DLaB',2, 'F', 'N'
		
		
**********************************************************************************/


	@ReviewID	int,	
	@Active	char (1) -- 'Y' active or 'N'not active
as
SET NOCOUNT ON

BEGIN


	Update	tblRW_localReview
	Set		sActive=@Active,
			dtActive=getdate()
	Where	lReviewID=@ReviewID
END

GO
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_ReviewActiveStatus] TO [web_user]
GO
