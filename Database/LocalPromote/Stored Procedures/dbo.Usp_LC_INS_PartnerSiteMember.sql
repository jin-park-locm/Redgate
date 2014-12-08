SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_PartnerSiteMember]
     @lSiteID		int
    ,@lMemberID		int
    ,@sSiteType		char(2)			= NULL
	,@sContact		char(1)			= NULL
    ,@sActive		char(1)			= 'Y'
    ,@szUpdatedBy	varchar(20)		= 'UI'
--	,@dtUpdate		datetime		= NULL
    
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
BEGIN

    INSERT INTO [dbo].[tblLP_PartnerSiteMember]
    ( 
         [lSiteID]
        ,[lMemberID]
        ,[sSiteType]
		,[sContact]
        ,[sActive]
        ,[szUpdatedBy]
        ,[dtUpdate]
        
    )
    VALUES
    (
         @lSiteID
        ,@lMemberID
        ,@sSiteType
		,@sContact
        ,@sActive
        ,@szUpdatedBy
        ,Getdate()
        
    )
IF @@ERROR = 0
SELECT @lSiteID		AS lSiteID 
	  ,@lMemberID	AS lMemberID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteMember] TO [web_user]
GO
