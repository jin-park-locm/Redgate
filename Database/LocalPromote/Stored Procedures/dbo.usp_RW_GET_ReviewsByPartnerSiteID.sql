SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_ReviewsByPartnerSiteID]
/**********************************************************************************
Description   :   Get all reviews by PartnerSiteID
Change History

Date       Name     Description
---------- -------- ------------------------------------
06-03-2008 Johnny Kang    Initial Development

EXAMPLES: 	usp_RW_GET_ReviewsByPartnerSiteID 1 
		
**********************************************************************************/
	@SiteID int
as


SET NOCOUNT ON

	SELECT 
		lReviewID as ReviewID, 
		dtReview as ReviewDate, 
		szLoginEmail as LoginEmail, 
		szFirstName as FirstName, 
		szMidName as MiddleName, 
		szLastName as LastName, 
		iRating as ReviewRating, 
		szReviewTitle as ReviewTitle, 
		szREviewText as ReviewText, 
		lSiteID as SiteID, 
		szDisplayName as DisplayName, 
		a.sActive as Active
	FROM tblRW_LocalReview a
	join tblRW_UserInfo b
	on a.lmemberid=b.lmemberid
	left join        
	tblLP_MemberInfo c
	on b.lmemberid = c.lmemberid
	left join
	listingstoremaster..acx_tbl_listing d
	on a.RID = d.RID
	WHERE 
		a.sActive='Y'
		AND lSiteID = @SiteID

GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_ReviewsByPartnerSiteID] TO [web_user]
GO
