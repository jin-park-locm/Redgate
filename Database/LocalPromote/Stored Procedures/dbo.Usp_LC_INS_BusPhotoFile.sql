SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusPhotoFile]     @lAdvertiserID		int    ,@sPhotoType		char(3)    ,@szTitle			varchar(100)	= NULL    ,@szPhotoDesc		varchar(300)	= NULL    ,@szFullLocation	varchar(300)    ,@szThumbnail		varchar(300)	    ,@sActive			char(1)			= 'Y'    ,@szUpdatedBy		varchar(20)		= 'UI'    ,@dtUpdate			datetime		= NULL    ASSET NOCOUNT ONDECLARE @lPhotoFileID int BEGIN     INSERT INTO [dbo].[tblLP_BusPhotoFile]    ( 
         [lAdvertiserID]        ,[sPhotoType]        ,[szTitle]        ,[szPhotoDesc]        ,[szFullLocation]        ,[szThumbnail]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lAdvertiserID        ,@sPhotoType        ,@szTitle        ,@szPhotoDesc        ,@szFullLocation        ,@szThumbnail        ,ISNULL (@sActive, 'Y')        ,ISNULL (@szUpdatedBy, 'UI')        ,ISNULL (@dtUpdate, Getdate())            )IF @@ERROR = 0SELECT @lPhotoFileID = SCOPE_IDENTITY()SELECT @lPhotoFileID as lPhotoFileID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusPhotoFile] TO [web_user]
GO
