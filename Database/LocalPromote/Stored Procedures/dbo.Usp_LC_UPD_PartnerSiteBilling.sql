SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[Usp_LC_UPD_PartnerSiteBilling]     @lSiteID		int    ,@lBillingID	int         = NULL    ,@sActive		char(1)		= NULL    ,@szUpdatedBy	varchar(20)	= NULL	,@dtUpdate		datetime	= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_PartnerSiteBilling]    SET          [lSiteID]		= ISNULL(@lSiteID, [lSiteID])        ,[lBillingID]	= ISNULL(@lBillingID, [lBillingID])        ,[sActive]		= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]	= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]		= ISNULL(@dtUpdate, Getdate())            WHERE [lSiteID] = @lSiteID  --	AND	  [lBillingID] = @lBillingIDIF @@ERROR = 0SELECT	 @lSiteID	AS lSiteID				,@lBillingID AS lBillingID	END


GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteBilling] TO [web_user]
GO
