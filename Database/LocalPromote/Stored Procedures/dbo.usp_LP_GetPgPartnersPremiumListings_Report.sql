SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LP_GetPgPartnersPremiumListings_Report]
AS

SELECT 
	 pt.szPartnerName
	,s.szSiteName
	,gb.bdc
	,isnull(gb.displaytitle, gb.title) as BDCTitle
	,l.*
FROM LocalPromote..tblLP_BusListing l (NOLOCK)
INNER JOIN LocalPromote..tblLP_ProductOrder O (NOLOCK) ON l.lAdvertiserID = o.lAdvertiserid and o.sactive = 'Y' and mPaidFee > 1.5 and l.sAction = 'TRN'
INNER JOIN LocalPromote..tblLP_ProductCampaign C (NOLOCK) ON o.lCIDNo = C.lCIDNo
INNER JOIN LocalPromote..tblLP_PartnerSite s (NOLOCK) ON c.lSiteID = s.lSiteID
INNER JOIN LocalPromote..tblLP_Partner pt (NOLOCK) ON pt.szPartnername like 'PG%' and s.lPartnerID = pt.lPartnerID
INNER JOIN LocalPromote..tblLP_BusListingCat (NOLOCK) bc ON l.ladvertiserid = bc.ladvertiserid
INNER JOIN LocalPromote..glb_tbl_BDC_Master gb (NOLOCK) ON bc.BDC = gb.BDC
ORDER BY szPartnerName, szSiteName 
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GetPgPartnersPremiumListings_Report] TO [ELIBERATION\vvinayak]
GO
