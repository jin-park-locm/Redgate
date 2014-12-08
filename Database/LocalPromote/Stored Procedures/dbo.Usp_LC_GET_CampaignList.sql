SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_CampaignList]@lSiteID int     AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSET NOCOUNT ON BEGIN    SELECT         [szCID]        ,[lCIDNo]        ,[lSiteID]        ,[lProductID]        ,[szSpecialName]        ,[szSpecialDesc]        ,[mSpecialPrice]        ,[sDefault]        ,[sDependency]        ,[sTimeCode]        ,[dtBeginning]        ,[dtEnd]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]        	FROM  [dbo].[tblLP_ProductCampaign]	WHERE lSiteID = @lSiteID    END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_CampaignList] TO [web_user]
GO
