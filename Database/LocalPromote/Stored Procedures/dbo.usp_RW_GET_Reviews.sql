SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE procedure [dbo].[usp_RW_GET_Reviews]
/**********************************************************************************
Description   :   Get the active Reviews

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-28-2008 John Lu    Initial Development

EXAMPLES: 	usp_RW_GET_Reviews 'Y' -- Get all records
		
**********************************************************************************/
	@ForAll Char='N'
as


SET NOCOUNT ON

If @ForAll = 'Y'
	Begin
	select lReviewID, dtReview, szLoginEmail, szFirstName, szMidName, szLastName, title, iRating, szReviewTitle, szREviewText, lSiteID, szDisplayName, a.sActive as Active
	From tblRW_LocalReview a
	join tblRW_UserInfo b
	on a.lmemberid=b.lmemberid
	left join        
	tblLP_MemberInfo c
	on b.lmemberid = c.lmemberid
	left join
	listingstoremaster..acx_tbl_listing d
	on a.RID = d.RID
	Where 
		a.sActive='Y'
	End
Else
	Begin
	select * from (
	select  top 35000
		lReviewID, dtReview, szLoginEmail, szFirstName, szMidName, szLastName, title, iRating, szReviewTitle, szREviewText, lSiteID, szDisplayName, a.sActive as Active
	From tblRW_LocalReview a
	join tblRW_UserInfo b
	on a.lmemberid=b.lmemberid
	left join        
	tblLP_MemberInfo c
	on b.lmemberid = c.lmemberid
	left join
	listingstoremaster..acx_tbl_listing d
	on a.RID = d.RID
	Where 
		a.sActive='Y'
	order by dtReview desc 
	) as l order by lReviewID
	End 



GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviews] TO [web_user]
GO
