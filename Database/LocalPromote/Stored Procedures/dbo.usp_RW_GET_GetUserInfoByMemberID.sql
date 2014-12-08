SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_GET_GetUserInfoByMemberID]
/**********************************************************************************
Description   :   Get the user info

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-28-2008 John Lu    Initial Development

EXAMPLES: 	usp_RW_GET_GetUserInfoByMemberID @MemberID
		
**********************************************************************************/

@MemberID int

as

select lMemberID, sZip, szDisplayName, lAgeRangeID, sGender, sOptIn, sActive 
	from tblRW_UserInfo
	where lMemberID = @MemberID
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByMemberID] TO [web_user]
GO
