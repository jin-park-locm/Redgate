SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BusPhotoFile]     @lPhotoFileID  int    ,@lAdvertiserID		int    ,@sPhotoType		char(3)    ,@szTitle			varchar(100)	= NULL    ,@szPhotoDesc		varchar(300)	= NULL    ,@szFullLocation	varchar(300)	= NULL    ,@szThumbnail		varchar(300)	= NULL    ,@sActive			char(1)			= NULL     ,@szUpdatedBy		varchar(20)		= NULL	     ,@dtUpdate			datetime		= NULL    ASSET NOCOUNT ONBEGIN     UPDATE [dbo].[tblLP_BusPhotoFile]    SET          [lAdvertiserID]		= ISNULL(@lAdvertiserID, [lAdvertiserID])        ,[sPhotoType]			= ISNULL(@sPhotoType, [sPhotoType])        ,[szTitle]				= ISNULL(@szTitle, [szTitle])        ,[szPhotoDesc]			= ISNULL(@szPhotoDesc, [szPhotoDesc])        ,[szFullLocation]		= ISNULL(@szFullLocation,[szFullLocation])        		,[szThumbnail]			= ISNULL(@szThumbnail, [szThumbnail])        ,[sActive]				= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]			= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]				= ISNULL(@dtUpdate, Getdate())   
         WHERE [lPhotoFileID] = @lPhotoFileIDIF @@ERROR = 0SELECT @lPhotoFileID as lPhotoFileID --, @szTitleEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusPhotoFile] TO [web_user]
GO
