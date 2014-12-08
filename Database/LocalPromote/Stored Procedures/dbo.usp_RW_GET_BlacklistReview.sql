SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_GET_BlacklistReview]
/**********************************************************************************
Description   :   Find the buiness listing accoding to RID and save the review for the RID

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-18-2007 dlabrie    Initial Development

EXAMPLES: 	usp_RW_GET_BlacklistReview
		
**********************************************************************************/

@lMemberID		 	int   

as
SET NOCOUNT ON

Select	RID,iRating, szReviewTitle, szREviewText, lSiteID, szDisplayName
From	tblRW_LocalReview a,
		tblRW_UserInfo b,
		tblRW_UserStatus c
Where	a.lMemberID=@lMemberID
and		a.lmemberid=b.lmemberid
and		a.lmemberid=c.lmemberid
and		a.sActive='N'
and		c.sStatus='BLK'
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_BlacklistReview] TO [web_user]
GO
