SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_RW_GET_ReviewByRID]
/**********************************************************************************
Description   :   Find the buiness listing accoding to RID and save the review for the RID

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-18-2007 dlabrie    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewByRID
		
**********************************************************************************/

@RID		 	int   

as


SET NOCOUNT ON

 

Select RID,iRating, szReviewTitle, szREviewText, lSiteID, szDisplayName
From  tblRW_LocalReview a,
      tblRW_UserInfo b
Where a.RID=@RID
and   a.lmemberid=b.lmemberid
and   a.sActive='Y'
and   b.sActive='Y'


GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByRID] TO [web_user]
GO
