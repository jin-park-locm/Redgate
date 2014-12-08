SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_MFEmailStatus]	 @lMemberID		int		= NULL    ,@lAdvertiserID int		= NULL
    ,@lPartnerID	int		= NULL
    ,@lSiteID		int		= NULL
    ,@lOrderNo		int		= NULL
	,@sAgencyID		char(2) = NULL
    ,@sStatus		char(3)	= NULL
    ,@dtUpdate		datetime	= NULL	,@szResetURL	varchar(250) = NULL    ASSET NOCOUNT ONDECLARE      @lMFEmailID			int    BEGIN    INSERT INTO [dbo].[tblLP_MFEmail]    ( 		[lMemberID]
       ,[lAdvertiserID]
       ,[lPartnerID]
       ,[lSiteID]
       ,[lOrderNo]
	   ,[sAgencyID]
       ,[sStatus]
       ,[dtUpdate]	   ,[szResetURL]    )    VALUES    (         @lMemberID        ,@lAdvertiserID		,@lPartnerID		,@lSiteID		,@lOrderNo	    ,@sAgencyID		,@sStatus		,ISNULL(@dtUpdate, getdate())	    ,@szResetURL            )IF @@ERROR = 0SELECT      @lMFEmailID = SCOPE_IDENTITY()SELECT      @lMFEmailID AS lMFEmailID END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [web_user]
GO
