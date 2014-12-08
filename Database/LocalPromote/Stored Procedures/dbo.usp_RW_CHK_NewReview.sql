SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_CHK_NewReview]
/**********************************************************************************
Description   :   Find the buiness listing accoding to RID and check to see if the 
		  review already exist before saving the review for the RID

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-18-2007 dlabrie    Initial Development

EXAMPLES: 	usp_RW_CHK_NewReview 'Quintessentials','92130', 0---IN LP
		
**********************************************************************************/

@RID		 	int,    
@Rating          	smallint,  
@ReviewTitle		Varchar(100),
@ReviewText		varchar(3000),
@UserId		int

as
SET NOCOUNT ON

Select 	count(*) as FindNo
from 	LocalPromote..tblRW_LocalReview
where 	RID=@Rid
and	BINARY_CHECKSUM(szReviewTitle, szReviewText,lMemberid)=BINARY_CHECKSUM(@ReviewTitle,@ReviewText,@userid)


GO
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_CHK_NewReview] TO [web_user]
GO
