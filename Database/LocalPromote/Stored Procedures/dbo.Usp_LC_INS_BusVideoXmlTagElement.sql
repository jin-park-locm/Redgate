SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusVideoXmlTagElement]     @lBusVideoXmlTagId				int    ,@lDataScrubbedStatusId			int    ,@szXmlTagElement				varchar(255)    ,@szXmlTagElementValue			varchar(6000)	= NULL    ,@dtActiveStart					datetime		= NULL   	,@dtActiveEnd					datetime		= NULL    ,@dtInsert						datetime		     ,@szInsertedBy					varchar(100)    ,@dtUpdate						datetime		= NULL    ,@szUpdatedBy					varchar(100)	= NULL    ASSET NOCOUNT ON SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDDECLARE @lBusVideoXmlTagElementId intBEGIN    INSERT INTO [dbo].[tblLP_BusVideoXmlTagElement]    (          [lBusVideoXmlTagId]        ,[lDataScrubbedStatusId]        ,[szXmlTagElement]        ,[szXmlTagElementValue]        ,[dtActiveStart]        ,[dtActiveEnd]        ,[dtInsert]        ,[szInsertedBy]        ,[dtUpdate]        ,[szUpdatedBy]            )    VALUES    (         @lBusVideoXmlTagId        ,@lDataScrubbedStatusId        ,@szXmlTagElement        ,@szXmlTagElementValue        ,@dtActiveStart        ,@dtActiveEnd        ,getdate()        ,@szInsertedBy		,@dtUpdate        ,@szUpdatedBy            )IF @@ERROR = 0SELECT @lBusVideoXmlTagElementId = SCOPE_IDENTITY()SELECT @lBusVideoXmlTagElementId AS lBusVideoXmlTagElementIdEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoXmlTagElement] TO [web_user]
GO
