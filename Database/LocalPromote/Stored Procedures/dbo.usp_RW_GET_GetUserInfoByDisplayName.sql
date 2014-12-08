SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_RW_GET_GetUserInfoByDisplayName]
/**********************************************************************************
Description   :   Check if the display name exists.  

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-28-2008 jkang    Initial Development

EXAMPLES: 	usp_RW_GET_GetUserInfoByDisplayName 'jkang'
		
**********************************************************************************/

@Displayname varchar(100)

as
SET NOCOUNT ON

Select 	count(*) as FindNo
from 	tblRW_UserInfo
where 	szDisplayName=@Displayname

GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_GetUserInfoByDisplayName] TO [web_user]
GO
