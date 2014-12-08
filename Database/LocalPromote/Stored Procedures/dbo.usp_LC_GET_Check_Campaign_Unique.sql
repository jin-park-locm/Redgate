SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_GET_Check_Campaign_Unique]
    @szCID		varchar(30)--, -- promo code
	--@lSiteID	int

    
AS
SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN

SELECT [szCID],[lCIDNo]
--      ,[szSpecialName]
--      ,[sActive]
FROM [tblLP_ProductCampaign]
WHERE [szCID]	= @szCID
--AND [lSiteID]	= @lSiteID

END





GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_Campaign_Unique] TO [web_user]
GO
