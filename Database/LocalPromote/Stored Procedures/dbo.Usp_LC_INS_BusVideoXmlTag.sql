SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusVideoXmlTag]
INTO [dbo].[tblLP_BusVideoXmlTag]
        ,[szUpdatedBy]
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [web_user]
GO