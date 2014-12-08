SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_PartnerSiteBilling]
     @lSiteID		int
    ,@lBillingID	int
    ,@sActive		char(1)		= 'Y'
    ,@szUpdatedBy	varchar(20)	= 'UI'
    --,@dtUpdate		datetime
    
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
BEGIN 
    INSERT INTO [dbo].[tblLP_PartnerSiteBilling]
    ( 
         [lSiteID]
        ,[lBillingID]
        ,[sActive]
        ,[szUpdatedBy]
        ,[dtUpdate]
        
    )
    VALUES
    (
         @lSiteID
        ,@lBillingID
        ,@sActive
        ,@szUpdatedBy
        ,Getdate()
        
    )

IF @@ERROR = 0
SELECT  @lSiteID	AS lSiteID,
		@lBillingID AS lBillingID	 

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSiteBilling] TO [web_user]
GO
