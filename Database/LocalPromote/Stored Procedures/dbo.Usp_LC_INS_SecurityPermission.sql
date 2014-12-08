SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_SecurityPermission]
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityPermission] TO [web_user]
GO