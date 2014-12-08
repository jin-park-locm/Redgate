SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LP_GET_DefaultCampaign]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development
05-06-2010 jipark	Include Billing Cycle.

EXAMPLES: 	usp_LP_GET_DefaultCampaign 2 -- Regular
			usp_LP_GET_DefaultCampaign 4 -- Upgrade
		
**********************************************************************************/
@SiteID		int

AS
SET NOCOUNT ON

BEGIN

select	a.szCid, a.lCidNo, a.lSiteID, a.lProductID, 
		a.szSpecialName, a.szSpecialDesc, a.mSpecialPrice,
		a.sDefault, a.sDependency, a.sAutoDefault, a.sTimeCode,
		a.dtBeginning, a.dtEnd, a.sActive, a.szUpdatedBy, a.dtUpdate, 
		b.szproductname,
		b.mdefaultprice, b.llevel, a.lBillingCycle
from	tbllp_productcampaign a 
join	tbllp_productlist b 
on		a.lproductid = b.lproductid 
where	a.sactive = 'Y' 
and		b.sactive = 'Y' 
and		getdate() >= a.dtbeginning  
and		(a.dtend is null or getdate() <= a.dtend) 
and		a.sautodefault ='Y'
and		a.lsiteid = @SiteID 
		
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_DefaultCampaign] TO [web_user]
GO
