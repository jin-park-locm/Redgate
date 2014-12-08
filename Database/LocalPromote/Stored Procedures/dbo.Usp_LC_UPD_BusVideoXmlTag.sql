SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BusVideoXmlTag]     @lBusVideoXmlTagId			int	,@lBusVideoAddressId		int    ,@lDataScrubbedStatusId		int    ,@szXmlTag					varchar(255)    ,@szXmlTagValue				varchar(6000)	= NULL    ,@dtActiveStart				datetime		= NULL    ,@dtActiveEnd				datetime		= NULL    ,@dtInsert					datetime		= NULL    ,@szInsertedBy				varchar(100)	= NULL    ,@dtUpdate					datetime		= NULL    ,@szUpdatedBy				varchar(100)	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_BusVideoXmlTag]    SET          [lBusVideoAddressId]		= ISNULL(@lBusVideoAddressId, [lBusVideoAddressId])        ,[lDataScrubbedStatusId]	= ISNULL(@lDataScrubbedStatusId, [lDataScrubbedStatusId])        ,[szXmlTag]					= ISNULL(@szXmlTag, [szXmlTag])        
		,[szXmlTagValue]			= ISNULL(@szXmlTagValue, [szXmlTagValue])        ,[dtActiveStart]			= ISNULL(@dtActiveStart, [dtActiveStart])        ,[dtActiveEnd]				= ISNULL(@dtActiveEnd, [dtActiveEnd])        ,[dtInsert]					= ISNULL(@dtInsert, [dtInsert])		,[szInsertedBy]				= ISNULL(@szInsertedBy, [szInsertedBy])        ,[dtUpdate]					= ISNULL(@dtUpdate, Getdate())        ,[szUpdatedBy]				= ISNULL(@szUpdatedBy, [szUpdatedBy])            WHERE [lBusVideoXmlTagId] = @lBusVideoXmlTagIdIF @@ERROR = 0SELECT @lBusVideoXmlTagId AS lBusVideoXmlTagId END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTag] TO [web_user]
GO
