SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_ListingAdDistribution]
	@lOrderNo		int
 
as  
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN  
	SELECT DISTINCT 
		  a.ladvertiserid 
		, a.lSiteID   
		, s.szSiteName
		, a.lOrderNo    
		, a.lAdServiceType  
	FROM  tblLP_AdDistribution	a
	JOIN  tblLP_ProductOrder	b	ON		b.lOrderNo = a.lOrderNo	
	JOIN  tblLP_PartnerSite     s   ON      s.lSiteID  = a.lSiteID
	WHERE b.lOrderNo = @lOrderNo
  
 
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingAdDistribution] TO [web_user]
GO
