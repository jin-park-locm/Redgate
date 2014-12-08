SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_Note]	 @lAllID			int	,@sNoteCode			char(3)	,@szNote			varchar(500)	,@sActive			char(1) = 'Y'	,@szUpdatedBy		varchar(20)	,@dtNote			datetime = NULL    ASSET NOCOUNT ONDECLARE      @lNoteID			int    BEGIN    INSERT INTO [dbo].[tblLP_AllNote]    (        [lAllID]
      ,[sNoteCode]
      ,[szNote]
      ,[sActive]
      ,[szUpdatedBy]
      ,[dtNote]    )    VALUES    (       @lAllID
      ,@sNoteCode
      ,@szNote
      ,@sActive
      ,@szUpdatedBy
      ,getdate()    )		IF @@ERROR = 0	SELECT      @lNoteID = SCOPE_IDENTITY()	SELECT      @lNoteID AS lNoteID 		
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
