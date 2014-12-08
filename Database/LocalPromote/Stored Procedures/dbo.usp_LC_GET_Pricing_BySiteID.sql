SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_Pricing_BySiteID]

@lSiteID  int  
  
AS  
SET NOCOUNT ON  
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
  
BEGIN  

SELECT TOP 1  
 ps.lPartnerID ,  
 ps.lSiteID ,  
 pc.szCID ,  
 pc.lCIDNo,  
 pc.szSpecialName ,  
 pc.szSpecialDesc,  
 pc.mSpecialPrice,  
 pc.sDefault,  
 pc.sTimeCode as Term,  
 pc.dtBeginning,  
 pc.dtEnd,  
 pc.sActive,  
  p.lLevel,
  p.szLevelDesc,
 pc.dtUpdate    
FROM   tblLP_PartnerSite ps 
JOIN  tblLP_ProductCampaign pc  ON pc.lSiteID = ps.lSiteID  
JOIN  tblLP_ProductList		pl  ON pl.lProductID = pc.lProductID 
JOIN  tblLP_ProductLevel	p   ON  p.lLevel = pl.lLevel  
WHERE ps.lSiteID  = @lSiteID
ORDER BY ps.lSiteID 

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Pricing_BySiteID] TO [web_user]
GO
