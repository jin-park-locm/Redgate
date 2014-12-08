SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_ProductCampaign]
--     @szCID				varchar(20)
	   @lCIDNo			int
     
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
 
BEGIN

    SELECT
         [szCID]
        ,[lCIDNo]
        ,[lSiteID]
        ,[lProductID]
        ,[szSpecialName]
		,[szSpecialDesc]
        ,[mSpecialPrice]
        ,[sDefault]
        ,[sDependency]
        ,[sTimeCode]
        ,[dtBeginning]
        ,[dtEnd]
        ,[sActive]
        ,[szUpdatedBy]
        ,[dtUpdate]
		,[lBillingCycle]
        
	FROM  [dbo].[tblLP_ProductCampaign]

	WHERE lCIDNo = @lCIDNo
	-- AND szCID = @szCID
    
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductCampaign] TO [web_user]
GO
