SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_PromoCode_BySiteID]    @lSiteID  int    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT         [szCID]        ,[lCIDNo]        ,[lSiteID]        ,[lProductID]        ,[szSpecialName]        ,[szSpecialDesc]        ,[mSpecialPrice]--        ,[sDefault]--        ,[sDependency]        ,[sTimeCode]        ,[dtBeginning]        ,[dtEnd]    FROM  [dbo].[tblLP_ProductCampaign]	WHERE   lSiteID   = @lSiteID	AND sActive = 'Y'END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PromoCode_BySiteID] TO [web_user]
GO
