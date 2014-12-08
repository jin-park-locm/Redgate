SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LP_Get_BusinessListingByMemberID]
/**********************************************************************************
Description   :   Find the buiness listing accoding to the information entered by
                  user on a web form. 
Change History

Date       Name     Description
---------- -------- ------------------------------------
09-10-2008 dlabrie  Add sActive to the last piece where clause Where a.lCIDno=b.lCIDNo and b.lSiteid=@SiteID 
10-30-2009 RFoote	DB-1795 - Removed the reference to the view vwLP_LastStatus and added a join to the 
					table tblLP_BusListingStatus where sLastStatus = 'Y'.
02-19-2010 bwu		Added email address, and ridax to the returned list, and changed the LevelDesc to upper case
example       :   
		usp_LP_Get_BusinessListingByMemberID '109',2
		usp_LP_Get_BusinessListingByMemberID '130078',280
**********************************************************************************/

@MemberID		int,
@SiteID			int

AS
SET NOCOUNT ON
	
 BEGIN
	SELECT	tblLP_BusListing.lAdvertiserid,
			'LM' AS agencyid,
			szTitle,
			szStreetName,
			szCity,
			sState,
			sPostalCode,
			szPhone,
			szEmail, 
			RIDAX as rid,
			szBusDesc,
			szURL,
			'Y' AS Claimed,
			isnull(llevel, 2) as lLevel,--case lLevel when null then 2 else lLevel end as lLevel,
			replace(isnull(szLevelDesc, 'Free'), 'Basic', 'Free') as szLevelDesc, --Case LLevel when null then 'Basic'else szLevelDesc end as szLevelDesc,
			tblAL_StatusType.sStatus,
			tblAL_StatusType.szStatusDesc
	FROM dbo.tblLP_BusListing 
	left outer JOIN dbo.vwLP_ListingOrderStatus 
		ON dbo.tblLP_BusListing.lAdvertiserID = dbo.vwLP_ListingOrderStatus.lAdvertiserID 
--	INNER JOIN	dbo.vwLP_LastStatus 
--	ON 		dbo.tblLP_BusListing.lAdvertiserID = dbo.vwLP_LastStatus.lAdvertiserID 
	--Added on 10/30/2009
	Inner Join dbo.tblLP_BusListingStatus 
			on tblLP_BusListing.lAdvertiserID = tblLP_BusListingStatus.lAdvertiserID
	Inner Join dbo.tblAL_StatusType
			on tblLP_BusListingStatus.sStatus = tblAL_StatusType.sStatus
	--
	LEFT OUTER JOIN dbo.tblLP_BusDescription 
	ON 		dbo.tblLP_BusListing.lAdvertiserID = dbo.tblLP_BusDescription.lAdvertiserID 
	WHERE   tblLP_BusListing.lMemberid=@MemberID
	AND		dbo.vwLP_ListingOrderStatus.lSiteID=@SiteID
	AND		tblLP_BusListing.sAction not in ('DEL', 'DND')
	and		tblLP_BusListingStatus.sLastStatus = 'Y'
UNION
SELECT		tblLP_BusListing.lAdvertiserid,
			'LM' AS agencyid,
			szTitle,
			szStreetName,
			szCity,
			sState,
			sPostalCode,
			szPhone,
			szEmail, 
			RIDAX as rid, 
			szBusDesc,
			szURL,
			'Y' AS Claimed,
			2 as lLevel,--case lLevel when null then 2 else lLevel end as lLevel,
			'Free' as szLevelDesc, --Case LLevel when null then 'Basic'else szLevelDesc end as szLevelDesc,
			tblAL_StatusType.sStatus,
			tblAL_StatusType.szStatusDesc
	FROM       	dbo.tblLP_BusListing 
--	INNER JOIN	dbo.vwLP_LastStatus 
--	ON 		dbo.tblLP_BusListing.lAdvertiserID = dbo.vwLP_LastStatus.lAdvertiserID 
	--Added on 10/30/2009
	Inner Join dbo.tblLP_BusListingStatus 
			on tblLP_BusListing.lAdvertiserID = tblLP_BusListingStatus.lAdvertiserID
	Inner Join dbo.tblAL_StatusType
			on tblLP_BusListingStatus.sStatus = tblAL_StatusType.sStatus
	--
	LEFT OUTER JOIN dbo.tblLP_BusDescription 
	ON 		dbo.tblLP_BusListing.lAdvertiserID = dbo.tblLP_BusDescription.lAdvertiserID 
	WHERE   tblLP_BusListing.lMemberid=@MemberID
	AND		tblLP_BusListing.sAction not in ('DEL', 'DND')
	AND		dbo.tblLP_BusListing.lAdvertiserid not in 
			(select ladvertiserid 
			 from 	tblLP_ProductOrder a, tblLP_ProductCampaign b
			 Where 	a.lCIDno=b.lCIDNo and b.lSiteid=@SiteID and a.sActive='Y')
	and		tblLP_BusListingStatus.sLastStatus = 'Y'


END
GO
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByMemberID] TO [web_user]
GO
