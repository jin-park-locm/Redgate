SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_RW_UPD_UserActiveStatus]
/**********************************************************************************
Description   :  Enter user status

Change History

Date       Name     Description
---------- -------- ------------------------------------
01-30-2008 dlabrie    Initial Development

EXAMPLES: 	usp_RW_INS_UserActiveStatus 'kirkhamthree@yahoo.com','92614', 'KirkhamM', 2,'M','N' 
			usp_RW_INS_UserActiveStatus 'shiaorong@yahoo.com','92867', 'DLaB',2, 'F', 'N'
		
**********************************************************************************/

	@lMemberid	int,
	@Active	char(1) -- 'Y' Active, 'N' deactive
as
SET NOCOUNT ON

BEGIN

	Update tblRW_UserInfo
	set 	sActive=@Active,
		dtUpdate=getdate()
	Where 	lMemberID=@lMemberID
END



GO
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_UPD_UserActiveStatus] TO [web_user]
GO
