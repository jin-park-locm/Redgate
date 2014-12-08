SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusLanguageSpoken]     @lLanguageID		int    ,@lAdvertiserID		int    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(20)	= 'UI'    ,@dtUpdate			datetime	= NULL    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    INSERT INTO [dbo].[tblLP_BusLanguageSpoken]    (          [lLanguageID]        ,[lAdvertiserID]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lLanguageID        ,@lAdvertiserID        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtUpdate,getdate())            )IF @@ERROR = 0SELECT @lLanguageID as lLanguageID, 		@lAdvertiserID as lAdvertiserIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusLanguageSpoken] TO [web_user]
GO
