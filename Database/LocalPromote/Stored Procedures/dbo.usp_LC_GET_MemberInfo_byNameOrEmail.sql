SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail]
	@szLoginName	varchar(50) = NULL
  , @szLoginEmail	varchar(150) = NULL

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT mi.[lMemberID]
      ,mi.[szLoginName]
	  ,mi.[szLoginEmail] 	
	  ,ms.[lSecurityLevelID]
FROM [dbo].[tblLP_MemberInfo] mi
JOIN [dbo].[tblLP_MemberSecurity] ms ON ms.[lMemberID] = mi.[lMemberID]
WHERE 
	(	mi.szLoginName  = @szLoginName
		OR	  
		mi.szLoginEmail	= @szLoginEmail
	)
--and ms.sActive='Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MemberInfo_byNameOrEmail] TO [web_user]
GO
