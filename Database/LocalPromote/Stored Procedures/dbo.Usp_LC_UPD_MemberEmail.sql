SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_MemberEmail]

IF @@ERROR = 0
SELECT  @lMemberEmailID AS lMemberEmailID 
 
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_MemberEmail] TO [web_user]
GO