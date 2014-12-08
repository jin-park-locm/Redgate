SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_RW_INS_UserStatus]     @lMemberID			int    ,@sStatus			char(3)		= NULL    ,@szUpdatedBy		varchar(20) = NULL    ,@dtUpdated			datetime    = NULL	,@sActive			char(1)     = NULL    ASSET NOCOUNT ON DECLARE  @lStatusID			int		,@ERR				int    BEGIN    INSERT INTO [dbo].[tblRW_UserStatus]    (          [lMemberID]        ,[sStatus]        ,[szUpdatedBy]        ,[dtUpdated]            )    VALUES    (         @lMemberID        ,ISNULL (@sStatus, 'BLK')        ,ISNULL (@szUpdatedBy, 'UI')        ,ISNULL (@dtUpdated, Getdate())            )SELECT @ERR = @@ERROR IF @sActive IS NOT NULLBEGIN	UPDATE m		SET sActive = @sActive 	FROM tblLP_Memberinfo m	WHERE lMemberID = @lMemberIDENDSELECT @ERR = @ERR+@@ERRORIF @ERR = 0SELECT @lStatusID = SCOPE_IDENTITY()SELECT @lStatusID AS lStatusID END
GO
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_INS_UserStatus] TO [web_user]
GO
