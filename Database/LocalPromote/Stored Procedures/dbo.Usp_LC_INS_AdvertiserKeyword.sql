SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_AdvertiserKeyword]     @lAdvertiserID		int    ,@szKeyword			varchar(150)    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(50) = 'UI'    ASSET NOCOUNT ON BEGINDECLARE @lKeywordiD int    INSERT INTO [dbo].[tblLP_AdvertiserKeyword]    (          [lAdvertiserid]        ,[szKeyword]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lAdvertiserID        ,@szKeyword        ,@sActive        ,@szUpdatedBy        ,Getdate()            )SELECT @lKeywordiD = SCOPE_IDENTITY()IF @@ERROR = 0SELECT  @lAdvertiserID AS lAdvertiserid, 		@lKeywordiD	   AS lKeywordiD  END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_AdvertiserKeyword] TO [web_user]
GO
