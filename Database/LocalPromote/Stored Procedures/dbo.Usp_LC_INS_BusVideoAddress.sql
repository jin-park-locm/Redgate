SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusVideoAddress]     @lBusVideoInfoId			int    ,@lBusVideoAddressTypeId	int    ,@lDataScrubbedStatusId		int    ,@szBusVideoAddress			varchar(6000)    ,@dtActiveStart				datetime	= NULL    ,@dtActiveEnd				datetime	= NULL    ,@dtInsert					datetime    ,@szInsertedBy				varchar(100)    ,@dtUpdate					datetime	= NULL    ,@szUpdatedBy				varchar(100)= 'UI'    ASSET NOCOUNT ON DECLARE @lBusVideoAddressId intBEGIN     INSERT INTO [dbo].[tblLP_BusVideoAddress]    (          [lBusVideoInfoId]        ,[lBusVideoAddressTypeId]        ,[lDataScrubbedStatusId]        ,[szBusVideoAddress]        ,[dtActiveStart]        ,[dtActiveEnd]        ,[dtInsert]        ,[szInsertedBy]        ,[dtUpdate]       
		,[szUpdatedBy]            )    VALUES    (         @lBusVideoInfoId        ,@lBusVideoAddressTypeId        ,@lDataScrubbedStatusId        ,@szBusVideoAddress        ,@dtActiveStart        ,@dtActiveEnd        ,getdate()        ,@szInsertedBy        ,@dtUpdate        ,@szUpdatedBy            )IF @@ERROR = 0 SELECT @lBusVideoAddressId = SCOPE_IDENTITY()SELECT @lBusVideoAddressId AS lBusVideoAddressIdEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoAddress] TO [web_user]
GO
