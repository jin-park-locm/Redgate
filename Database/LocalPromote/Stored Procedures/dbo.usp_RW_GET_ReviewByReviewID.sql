SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewByReviewID]
/**********************************************************************************
Description   :   Get the Review by ReviewID

Change History

Date       Name     Description
---------- -------- ------------------------------------
03-18-2008 jkang    Initial Development
05-19-2008 jkang    Removed sactive = 'Y'
04-16-2009 bwu      Added paging (LPIS-440)
05-18-2009 bwu		Added default parameters

EXAMPLES: 	

exec usp_RW_GET_ReviewByReviewID 33, 2, 1, 10

exec usp_RW_GET_ReviewByReviewID 33

exec usp_RW_GET_ReviewByReviewID @SiteID=2,@ReviewID=16532,@CurrentPage=1,@PageSize=10 
		
**********************************************************************************/

@ReviewID		int, 
@SiteID			int = null,
@CurrentPage	int = null,
@PageSize		int = null
  
as

SET NOCOUNT ON

if (@SiteID is null or @CurrentPage	is null or @PageSize is null)
begin
	select lReviewID, dtReview, szFirstName, szMidName, szLastName, title, iRating, 
		szReviewTitle, szREviewText, lSiteID, szDisplayName
	From tblRW_LocalReview a
	join tblRW_UserInfo b
	on a.lmemberid=b.lmemberid
	left join tblLP_MemberInfo c
	on b.lmemberid = c.lmemberid
	left join listingstoremaster..acx_tbl_listing d
	on a.RID = d.RID
	Where a.lReviewID=@ReviewID and a.sActive = 'Y'
End
Else
begin
	Declare @TotalRecord int

	--Create variable to identify the first and last record that should be selected
	DECLARE @FirstRec int, @LastRec int
	SELECT @FirstRec = (@CurrentPage - 1) * @PageSize
	SELECT @LastRec = (@CurrentPage * @PageSize + 1)

	;With RWTable as
	( 
	SELECT	ROW_NUMBER() OVER(ORDER BY dtReview DESC) as ID,
		lReviewID as ReviewID, dtReview as ReviewDate, szLoginEmail as LoginEmail, 
		szReviewTitle as ReviewTitle, szREviewText as ReviewText, 
		szDisplayName as DisplayName, lSiteID as SiteID
	From tblRW_LocalReview a
	join tblRW_UserInfo b on a.lmemberid=b.lmemberid
	left join tblLP_MemberInfo c on b.lmemberid = c.lmemberid
	left join listingstoremaster..acx_tbl_listing d on a.RID = d.RID
	Where a.lReviewID=@ReviewID and lSiteID = @SiteID and a.sActive = 'Y'
	)

	SELECT
	  ReviewID, ReviewDate, LoginEmail, ReviewTitle, ReviewText, 
	  DisplayName, SiteID
	FROM RWTable
	WHERE ID > @FirstRec AND ID < @LastRec

	SELECT @TotalRecord = COUNT(*) 
	From tblRW_LocalReview a
	join tblRW_UserInfo b on a.lmemberid=b.lmemberid
	left join tblLP_MemberInfo c on b.lmemberid = c.lmemberid
	left join listingstoremaster..acx_tbl_listing d on a.RID = d.RID
	Where a.lReviewID=@ReviewID and lSiteID = @SiteID

	Return @TotalRecord
End

GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewByReviewID] TO [web_user]
GO
