SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_AdServiceArea]     @lOrderNo			int    ,@lAdvertiserID		int    ,@lLocationID		int    ,@lAdServiceType	int    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(20)	= 'UI'	,@dtUpdate			datetime    = NULL	     ASSET NOCOUNT ONDECLARE @lAdServiceAreaID intSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    INSERT INTO [dbo].[tblLP_AdServiceArea]    (          [lOrderNo]        ,[lAdvertiserID]        ,[lLocationID]        ,[lAdServiceType]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lOrderNo        ,@lAdvertiserID        ,@lLocationID        ,@lAdServiceType        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtUpdate,Getdate())            )IF @@ERROR = 0 SET @lAdServiceAreaID = SCOPE_IDENTITY()SELECT @lAdServiceAreaID AS lAdServiceAreaID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdServiceArea] TO [web_user]
GO
