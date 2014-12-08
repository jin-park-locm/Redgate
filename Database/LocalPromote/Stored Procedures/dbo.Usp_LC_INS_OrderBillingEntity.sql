SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_OrderBillingEntity]     @lBillingEntityID  int    ,@lOrderNo			int    ,@sActive			char(1)			= 'Y'    ,@szUpdatedBy		varchar(20)		= 'UI'    ,@dtUpdate			datetime		= NULL     ASSET NOCOUNT ON DECLARE @lOBEID intBEGIN    INSERT INTO [dbo].[tblLP_OrderBillingEntity]    (          [lBillingEntityID]        ,[lOrderNo]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lBillingEntityID        ,@lOrderNo        ,@sActive        ,@szUpdatedBy        ,getDate()            )IF @@ERROR = 0SELECT @lOBEID = SCOPE_IDENTITY()SELECT @lOBEID AS lOBEID   END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_OrderBillingEntity] TO [web_user]
GO
