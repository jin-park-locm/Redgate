SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_SecurityLevel]

GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_SecurityLevel] TO [web_user]
GO