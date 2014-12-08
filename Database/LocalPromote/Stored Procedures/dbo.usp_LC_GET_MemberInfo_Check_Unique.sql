SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_MemberInfo_Check_Unique] 


	@szLoginName	varchar(50) = NULL
  , @szLoginEmail	varchar(150) = NULL
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN	 

	SELECT	distinct 
					lMemberID
--					,szLoginName
--					,szLoginEmail 
--					,szLastName 
--					,szMidName
--					,szFirstName
	From  tblLP_MemberInfo		  
	WHERE 
    (
		szLoginName		= @szLoginName
		OR	  
		szLoginEmail	= @szLoginEmail
	)
	Order By  lMemberID

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_Check_Unique] TO [web_user]
GO
