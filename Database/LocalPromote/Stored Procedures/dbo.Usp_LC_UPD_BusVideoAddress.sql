SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BusVideoAddress]     @lBusVideoAddressId		int    ,@lBusVideoInfoId			int    ,@lBusVideoAddressTypeId	int    ,@lDataScrubbedStatusId		int    ,@szBusVideoAddress			varchar(6000)	= NULL    ,@dtActiveStart				datetime		= NULL    ,@dtActiveEnd				datetime		= NULL    ,@dtInsert					datetime		= NULL    ,@szInsertedBy				varchar(100)	= NULL    ,@dtUpdate					datetime		= NULL    ,@szUpdatedBy				varchar(100)    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_BusVideoAddress]    SET 		 [lBusVideoInfoId]			=	ISNULL(@lBusVideoInfoId, [lBusVideoInfoId])        ,[lBusVideoAddressTypeId]	=	ISNULL(@lBusVideoAddressTypeId, [lBusVideoAddressTypeId])        ,[lDataScrubbedStatusId]	=	ISNULL(@lDataScrubbedStatusId, [lDataScrubbedStatusId])        ,[szBusVideoAddress]		=	ISNULL(@szBusVideoAddress, [szBusVideoAddress])        ,[dtActiveStart]			=	ISNULL(@dtActiveStart, [dtActiveStart])        ,[dtActiveEnd]				=	ISNULL(@dtActiveEnd, [dtActiveEnd])        ,[dtInsert]					=	ISNULL(@dtInsert, [dtInsert])        ,[szInsertedBy]				=	ISNULL(@szInsertedBy, [szInsertedBy])        ,[dtUpdate]					=	ISNULL(@dtUpdate, Getdate())        ,[szUpdatedBy]				=	ISNULL(@szUpdatedBy, [szUpdatedBy])            WHERE [lBusVideoAddressId] = @lBusVideoAddressId
IF @@ERROR = 0SELECT @lBusVideoAddressId AS lBusVideoAddressIdEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoAddress] TO [web_user]
GO
