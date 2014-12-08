SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_AdServiceArea]     @lAdServiceAreaID	int    ,@lOrderNo			int			= NULL    ,@lAdvertiserID		int			= NULL    ,@lLocationID		int			= NULL    ,@lAdServiceType	int			= NULL    ,@sActive			char(1)		= NULL    ,@szUpdatedBy		varchar(20)	= NULL    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_AdServiceArea]			SET 				 [lOrderNo]			= ISNULL(@lOrderNo, [lOrderNo])				,[lAdvertiserID]	= ISNULL(@lAdvertiserID, [lAdvertiserID])				,[lLocationID]		= ISNULL(@lLocationID, [lLocationID])				,[lAdServiceType]	= ISNULL(@lAdServiceType, [lAdServiceType])				,[sActive]			= ISNULL(@sActive, [sActive])				,[szUpdatedBy]		= ISNULL(@szUpdatedBy, [szUpdatedBy])				,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())            WHERE [lAdServiceAreaID] = @lAdServiceAreaIDIF @@ERROR = 0SELECT @lAdServiceAreaID AS lAdServiceAreaIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdServiceArea] TO [web_user]
GO
