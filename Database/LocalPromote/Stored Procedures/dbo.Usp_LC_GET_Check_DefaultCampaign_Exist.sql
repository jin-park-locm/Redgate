SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist]
@lSiteID int,
@lProductID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


SELECT lCIDNo
FROM 
tblLP_ProductCampaign
WHERE 
lSiteID = @lSiteID
AND lProductID = @lProductID
AND
sDefault = 'Y'
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Check_DefaultCampaign_Exist] TO [web_user]
GO
