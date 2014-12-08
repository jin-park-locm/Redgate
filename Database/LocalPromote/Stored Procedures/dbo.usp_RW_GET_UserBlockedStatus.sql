SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_GET_UserBlockedStatus]
/**********************************************************************************
Description   :   Get current User Blicked Status

Change History

Date       Name     Description
---------- -------- ------------------------------------
06-13-2008 jkang    Initial Development

EXAMPLES: 	usp_RW_GET_UserBlockedStatus 82600
		
**********************************************************************************/

@MemberID		 	int   

as


SET NOCOUNT ON


SELECT 
	lMemberID  as MemberID,
	sStatus as Status
FROM
	tblRW_UserStatus
Where 
lMemberID=@MemberID
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_UserBlockedStatus] TO [web_user]
GO
