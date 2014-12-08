SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_RW_GET_ReviewByMemberID]
/**********************************************************************************
Description   :   Find the buiness listing accoding to RID and save the review for the RID

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-18-2007 dlabrie    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewByMemberID 1081, 1
			usp_RW_GET_ReviewByMemberID 1081, 2
			usp_RW_GET_ReviewByMemberID 1081, 3
		
**********************************************************************************/

	@lMemberID 	int ,
	@sort int

as


SET NOCOUNT ON

If @Sort=1

Select      a.RID,iRating, szReviewTitle, 
			szREviewText, lSiteID, szDisplayName, 
			a.sActive as ReviewStatus, b.sActive as MemberStatus,
			c.Title as BusTitle,
			c.Address as BusAddress,
			dtReview
From		tblRW_LocalReview a,
            tblRW_UserInfo b,
			ListingStoreMaster..acx_tbl_Listing c
Where		a.lMemberID=@lMemberID
and         a.lmemberid=b.lmemberid
and			a.RID=c.Rid
and			a.sActive='Y'
order by	dtReview desc

IF @Sort=2

Select      a.RID,iRating, szReviewTitle, 
			szREviewText, lSiteID, szDisplayName, 
			a.sActive as ReviewStatus, b.sActive as MemberStatus,
			c.Title as BusTitle,
			c.Address as BusAddress,
			dtReview
From		tblRW_LocalReview a,
            tblRW_UserInfo b,
			ListingStoreMaster..acx_tbl_Listing c
Where		a.lMemberID=@lMemberID
and         a.lmemberid=b.lmemberid
and			a.RID=c.Rid
and			a.sActive='Y'
order by	iRating desc, dtReview desc

IF @Sort=3

Select      a.RID,iRating, szReviewTitle, 
			szREviewText, lSiteID, szDisplayName, 
			a.sActive as ReviewStatus, b.sActive as MemberStatus,
			c.Title as BusTitle,
			c.Address as BusAddress,
			dtReview
From		tblRW_LocalReview a,
            tblRW_UserInfo b,
			ListingStoreMaster..acx_tbl_Listing c
Where		a.lMemberID=@lMemberID
and         a.lmemberid=b.lmemberid
and			a.RID=c.Rid
and			a.sActive='Y'
order by	iRating asc, dtReview desc
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByMemberID] TO [web_user]
GO
