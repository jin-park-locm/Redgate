SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE  [dbo].[Usp_LC_GET_ProductPricing_BySiteID]     @lPartnerID  intASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN SELECT          p.[lProductID]        ,p.[lPartnerID]        ,p.[szProductName]        ,p.[szProductDesc]        ,p.[mDefaultPrice]        ,p.[lLevel]        ,p.[sTimeCode]        ,p.[sActive]        ,p.[szUpdatedBy]        ,p.[dtUpdate]        ,pc.[lSiteID]        ,pc.[szSpecialName]        ,pc.[szSpecialDesc]        ,pc.[mSpecialPrice]        ,pc.[sDefault]		,pc.[sTimeCode]        ,pc.[dtBeginning]        ,pc.[dtEnd]       FROM [tblLP_ProductList] pJOIN [tblLP_PartnerSite] ps		ON	p.lPartnerID = ps.lPartnerIDJOIN [tblLP_ProductCampaign] pc ON  pc.lSiteID   = ps.lSiteIDWHERE   p.[lPartnerID] = @lPartnerID  ORDER BY  p.[lPartnerID]END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_ProductPricing_BySiteID] TO [web_user]
GO
