SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_GET_ActiveReviewByMemberID]
/**********************************************************************************
Description   :   Find the buiness listing accoding to RID and save the review for the RID

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-18-2007 dlabrie    Initial Development

EXAMPLES: 	usp_RW_UPD_ActiveReviewByMemberID
		
**********************************************************************************/

@lMemberID		 	int   

as
SET NOCOUNT ON

Select	RID,lRating, szReviewTitle, szREviewText, lStieID, szDisplayName
From	tblRW_LocalReivew a,
		tblRW_UserInfo b
Where	a.lMemberID=@lMemberID
and		a.lmemberid=b.lmemberid
and		a.sActive='Y'


GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ActiveReviewByMemberID] TO [web_user]
GO
