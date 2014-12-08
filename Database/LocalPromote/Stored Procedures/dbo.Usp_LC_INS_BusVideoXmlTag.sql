SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusVideoXmlTag]	 @lBusVideoAddressId		int    ,@lDataScrubbedStatusId		int    ,@szXmlTag					varchar(255)    ,@szXmlTagValue				varchar(6000)	= NULL    ,@dtActiveStart				datetime		= NULL    ,@dtActiveEnd				datetime		= NULL    ,@dtInsert					datetime		= NULL    ,@szInsertedBy				varchar(100)    ,@dtUpdate					datetime		= NULL    ,@szUpdatedBy				varchar(100)	= NULL    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDDECLARE @lBusVideoXmlTagId intBEGIN    INSERT 
INTO [dbo].[tblLP_BusVideoXmlTag]    ( 		 [lBusVideoAddressId]        ,[lDataScrubbedStatusId]        ,[szXmlTag]        ,[szXmlTagValue]        ,[dtActiveStart]        ,[dtActiveEnd]        ,[dtInsert]        ,[szInsertedBy]        ,[dtUpdate]
        ,[szUpdatedBy]            )    VALUES    (         @lBusVideoAddressId        ,@lDataScrubbedStatusId        ,@szXmlTag        ,@szXmlTagValue        ,@dtActiveStart        ,@dtActiveEnd        ,getdate()        ,@szInsertedBy        ,@dtUpdate        ,ISNULL (@szUpdatedBy, 'UI')            ) IF @@ERROR = 0SELECT @lBusVideoXmlTagId = SCOPE_IDENTITY()SELECT @lBusVideoXmlTagId as lBusVideoXmlTagIdEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTag] TO [web_user]
GO
