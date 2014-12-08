SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[usp_RW_INS_UserInfo]
/**********************************************************************************
Description   :  Create a new user login. If the email address found in the table then 
				Update sUserType to 'BR' otherwise, enter a new account with userType='RR'

Change History

Date       Name     Description
---------- -------- ------------------------------------
01-30-2008 dlabrie    Initial Development

EXAMPLES: 	usp_RW_INS_UserInfo 'kirkhamthree@yahoo.com','92614', 'KirkhamM', 2,'M','N' 
			usp_RW_INS_UserInfo 'shiaorong@yahoo.com','92867', 'DLaB',2, 'F', 'N'
		
**********************************************************************************/


	@LoginEmail	Varchar(100),
	@Zip	 	char (5),
	@DisplayName	varchar(20)	,
	@AgeRangeID	int,
	@Gender 	char (1),
	@OptIn		char(1)	

as
SET NOCOUNT ON

BEGIN
Declare @Memberid int
Set @MemberID =(Select lmemberid from tblLP_MemberInfo where szLoginEmail=@LoginEmail)

	Insert into tblRW_UserInfo
	(lMemberID, sZip, szDisplayName, lAgeRangeID, sGender, sOptIn, sActive, dtActive)
	Values(@MemberID, @Zip, @DisplayName, @AgeRangeID,@Gender,@OptIn,'N', getdate())
END


GO
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserInfo] TO [web_user]
GO
