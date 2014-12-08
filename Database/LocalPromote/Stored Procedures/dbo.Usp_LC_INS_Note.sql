SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_Note]
      ,[sNoteCode]
      ,[szNote]
      ,[sActive]
      ,[szUpdatedBy]
      ,[dtNote]
      ,@sNoteCode
      ,@szNote
      ,@sActive
      ,@szUpdatedBy
      ,getdate()
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Note] TO [web_user]
GO