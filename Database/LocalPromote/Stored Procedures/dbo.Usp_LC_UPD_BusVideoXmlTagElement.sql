SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BusVideoXmlTagElement]     @lBusVideoXmlTagElementId		int    ,@lBusVideoXmlTagId				int    ,@lDataScrubbedStatusId			int    ,@szXmlTagElement				varchar(255)    ,@szXmlTagElementValue			varchar(6000)	= NULL    ,@dtActiveStart					datetime		= NULL    ,@dtActiveEnd					datetime		= NULL    ,@dtInsert						datetime		= NULL		     ,@szInsertedBy					varchar(100)	= NULL    ,@dtUpdate						datetime		= NULL    ,@szUpdatedBy					varchar(100)	= NULLASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_BusVideoXmlTagElement]    SET          [lBusVideoXmlTagId]		= ISNULL(@lBusVideoXmlTagId, [lBusVideoXmlTagId])        ,[lDataScrubbedStatusId]	= ISNULL(@lDataScrubbedStatusId, [lDataScrubbedStatusId])        ,[szXmlTagElement]			= ISNULL(@szXmlTagElement, [szXmlTagElement])        ,[szXmlTagElementValue]		= ISNULL(@szXmlTagElementValue, [szXmlTagElementValue])        ,[dtActiveStart]			= ISNULL(@dtActiveStart, [dtActiveStart])        ,[dtActiveEnd]				= ISNULL(@dtActiveEnd, [dtActiveEnd])        ,[dtInsert]					= ISNULL(@dtInsert, [dtInsert])        ,[szInsertedBy]				= ISNULL(@szInsertedBy, [szInsertedBy])        ,[dtUpdate]					= ISNULL(@dtUpdate, Getdate())        ,[szUpdatedBy]				= ISNULL(@szUpdatedBy, [szUpdatedBy])     
       WHERE [lBusVideoXmlTagElementId] = @lBusVideoXmlTagElementIdIF @@ERROR = 0SELECT @lBusVideoXmlTagElementId as lBusVideoXmlTagElementIdEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusVideoXmlTagElement] TO [web_user]
GO
