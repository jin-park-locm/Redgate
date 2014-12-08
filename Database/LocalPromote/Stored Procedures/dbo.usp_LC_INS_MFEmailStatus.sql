SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_MFEmailStatus]
    ,@lPartnerID	int		= NULL
    ,@lSiteID		int		= NULL
    ,@lOrderNo		int		= NULL
	,@sAgencyID		char(2) = NULL
    ,@sStatus		char(3)	= NULL
    ,@dtUpdate		datetime	= NULL
       ,[lAdvertiserID]
       ,[lPartnerID]
       ,[lSiteID]
       ,[lOrderNo]
	   ,[sAgencyID]
       ,[sStatus]
       ,[dtUpdate]
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_MFEmailStatus] TO [web_user]
GO