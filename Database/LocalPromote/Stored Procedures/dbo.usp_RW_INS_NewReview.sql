SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_INS_NewReview]
/**********************************************************************************
Description   :   Find the buiness listing accoding to RID and save the review for the RID

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-18-2007 dlabrie    Initial Development

EXAMPLES: 	usp_RW_INS_Review 
		
**********************************************************************************/

@RID		 	int,    
@Rating          	smallint,  
@ReviewTitle		Varchar(100),
@ReviewText		varchar(3000),
@lUserId		int,
@lSiteID	Int

as
SET NOCOUNT ON


Insert into tblRW_LocalReview
(RID, iRating, szReviewTitle, szReviewText, lSiteID,sActive, dtActive,lMemberid, dtReview)
Values( @RID, @Rating, @ReviewTitle, @ReviewText,@lSiteID,  'N', getdate(),@lUserid,getdate())
return @@identity
GO
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_NewReview] TO [web_user]
GO
