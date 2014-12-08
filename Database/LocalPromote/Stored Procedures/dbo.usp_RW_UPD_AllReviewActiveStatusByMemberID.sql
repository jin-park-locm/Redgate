SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID]
/**********************************************************************************
Description   :   Update all Reviews by Member with Status Value

Change History

Date       Name     Description
---------- -------- ------------------------------------
05-16-2008 jkang    Initial Development

EXAMPLES: 	usp_RW_UPD_AllReviewActiveStatusByMemberID 35, 'Y'
		
**********************************************************************************/

	@MemberID	int,	
	@Active	char (1) -- 'Y' active or 'N'not active
as
SET NOCOUNT ON

BEGIN


	Update	tblRW_localReview
	Set		sActive=@Active,
			dtActive=getdate()
	Where	lMemberID=@MemberID
END
GO
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_AllReviewActiveStatusByMemberID] TO [web_user]
GO
