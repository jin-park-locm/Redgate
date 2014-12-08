SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_BusLanguageSpoken]     @lLanguageID		int    ,@lAdvertiserID		int			     ,@sActive			char(1)		= NULL    ,@szUpdatedBy		varchar(20) = NULL    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_BusLanguageSpoken]    SET          [lLanguageID]		= ISNULL(@lLanguageID, [lLanguageID])        ,[lAdvertiserID]	= ISNULL(@lAdvertiserID, [lAdvertiserID])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]		= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())            WHERE [lLanguageID] = @lLanguageID AND [lAdvertiserID] = @lAdvertiserIDIF @@ERROR = 0SELECT	 @lLanguageID	AS lLanguageID		,@lAdvertiserID AS lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_BusLanguageSpoken] TO [web_user]
GO
