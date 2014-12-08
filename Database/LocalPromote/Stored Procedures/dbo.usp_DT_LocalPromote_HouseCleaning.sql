SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_DT_LocalPromote_HouseCleaning]
AS
BEGIN
	SET NOCOUNT ON;

	/* Update Order Status */
	Update  tblLP_ProductOrder
	set     sActive='N'
	where	dtBeginning > (getdate() + 2)
	and		sActive = 'Y'

	Update	tblLP_ProductOrder
	set		sActive='Y'
	where	dtBeginning < (getdate() + 1.5)
	and		dtEnd > (getdate() + 1)
	and     sActive = 'N'

	Update	tblLP_ProductOrder
	set		sActive='N'
	where	dtEnd is not null
	and		dtEnd < (getdate() - 1)
	and		dtend <> '1900-01-01 00:00:00.000'
	and		sActive = 'Y'

	Update	tblLP_ProductOrder
	set		sActive='Y'
	where	dtEnd is not null
	and		dtBeginning < (getdate() + 1.5)
	and		dtend > getdate()
	and		dtend <>'1900-01-01 00:00:00.000'
	and		sActive='N'

	update	tblLP_ProductOrder
	set		sActive = 'I' ,szUpdatedBy = 'DT_HouseCleaning', dtUpdate = getdate()
	where	dtend <> '1900-01-01 00:00:00.000'
	and		sActive not in ('I', 'P')
	and		(convert(varchar(10), dtBeginning, 101) = convert(varchar(10), dtEnd, 101)
			or dtBeginning >= dtEnd)	

	/* Clean duplicate Orders by CampaignID */
	Update	a
	set		a.sActive='I',a.szUpdatedBy='DT_HouseCleaning', a.dtUpdate = GETDATE()
	from 	tblLP_ProductOrder a
	join	(
				select	lAdvertiserID, lCIDNo, MIN(lOrderNo) as minOrderNo		--keep old order
				from	tblLP_ProductOrder
				where	sActive = 'Y'
				group	by lAdvertiserID, lCIDNo
				having	count(*) > 1
			) b on (a.lAdvertiserID=b.lAdvertiserID and a.lCIDNo=b.lCIDNo)
	where	a.sActive='Y'
	and		a.lOrderNo<>b.minOrderNo
	
	/* Clean duplicate Orders by SiteID */
	select	a.lOrderNo,a.lAdvertiserID,b.lSiteID,identity(int,1,1) as tableKey into #dupOrder_siteID
	from 	tblLP_ProductOrder a
	join	tblLP_ProductCampaign b on (a.lCIDNo=b.lCIDNo)
	join	(
				select	o.lAdvertiserID, c.lSiteID
				from	tblLP_ProductOrder o
				join	tblLP_ProductCampaign c on (o.lCIDNo=c.lCIDNo)
				where	o.sActive = 'Y'
				group	by o.lAdvertiserID, c.lSiteID
				having	count(*) > 1
			) d on (a.lAdvertiserID=d.lAdvertiserID and	b.lSiteID=d.lSiteID)
	where	a.sActive='Y'
	order	by a.lAdvertiserID,a.mPaidFee desc	--Keep max paid order

	Update	a
	set		a.sActive='I',a.szUpdatedBy='DT_HouseCleaning', a.dtUpdate = GETDATE()
	from 	tblLP_ProductOrder a
	join	#dupOrder_siteID b on (a.lOrderNo=b.lOrderNo)
	join	(
				select lAdvertiserID,lSiteID,MIN(tableKey) as mintableKey
				from	#dupOrder_siteID
				group	by lAdvertiserID,lSiteID
			) c on (b.lAdvertiserID=c.lAdvertiserID and b.lSiteID=c.lSiteID)
	where	a.sActive='Y'
	and		b.tableKey <> c.mintableKey
	
	drop table #dupOrder_siteID

/* Activated Orders */
	select	a.* into #activeOrders
	from	tblLP_BusListing a
	join	tblLP_ProductOrder o on (o.lAdvertiserID = a.lAdvertiserID and o.sActive='Y')
	where	a.sAgencyID = 'AF'
	and		a.sAction in ('TRN', 'UPD', 'ADD')

	update	a
	set		a.sAction = case when a.sAction='TRN' then 'UPD' else a.sAction end,
			a.sAgencyID = 'AP',
			a.dtAction = GETDATE(),
			a.szUpdatedBy = 'DT_HouseCleaning'
	from	tblLP_BusListing a
	join	#activeOrders b on (a.lAdvertiserID=b.lAdvertiserID)

	update	a
	set		a.sLastStatus='N'
	from	tblLP_BusListingStatus a
	join	#activeOrders b on (a.lAdvertiserID=b.lAdvertiserID and a.sLastStatus='Y')
	where	a.sStatus<>'APV'
	
	insert	tblLP_BusListingStatus (lAdvertiserID, sStatus, sLastStatus, sActive, szUpdatedBy, dtStatus)
	select	a.lAdvertiserID, 'APV' as sStatus, 'Y' as sLastStatus, 'Y' as sActive, 'DT_HouseCleaning' as szUpdatedBy, getdate() as dtStatus
	from	#activeOrders a
	left join tblLP_BusListingStatus b on (a.lAdvertiserID=b.lAdvertiserID and b.sLastStatus='Y' and b.sStatus='APV')
	where	b.lAdvertiserID is null
	
	drop table #activeOrders

/* De-activated Orders */
	select	a.* into #DeactiveOrders
	from	tblLP_BusListing a
	left join	tblLP_ProductOrder o on (o.lAdvertiserID = a.lAdvertiserID and o.sActive='Y')
	where	a.sAgencyID = 'AP'
	and		a.sAction in ('TRN', 'UPD', 'ADD')
	and		o.lAdvertiserID is null

	update	a
	set		a.sAction = case when a.sAction='TRN' then 'UPD' else a.sAction end,
			a.sAgencyID = 'AF',
			a.dtAction = GETDATE(),
			a.szUpdatedBy = 'DT_HouseCleaning'
	from	tblLP_BusListing a
	join	#DeactiveOrders b on (a.lAdvertiserID=b.lAdvertiserID)

	update	a
	set		a.sLastStatus='N'
	from	tblLP_BusListingStatus a
	join	#DeactiveOrders b on (a.lAdvertiserID=b.lAdvertiserID and a.sLastStatus='Y')
	where	a.sStatus<>'APV'
	
	insert	tblLP_BusListingStatus (lAdvertiserID, sStatus, sLastStatus, sActive, szUpdatedBy, dtStatus)
	select	a.lAdvertiserID, 'APV' as sStatus, 'Y' as sLastStatus, 'Y' as sActive, 'DT_HouseCleaning' as szUpdatedBy, getdate() as dtStatus
	from	#DeactiveOrders a
	left join tblLP_BusListingStatus b on (a.lAdvertiserID=b.lAdvertiserID and b.sLastStatus='Y' and b.sStatus='APV')
	where	b.lAdvertiserID is null
	
	drop table #DeactiveOrders

	/* ProductCampaign */
	/*
	Update	cmpn
	set		sAdcenter = 'N'
	--		select sAdcenter, cmpn.*
	from	tblLP_ProductCampaign cmpn
	where	lSiteID = 2 
	and 	sAdcenter = 'Y'
	*/
	
	/* PartnerSiteMember */
	/*
	insert	tblLP_PartnerSitemember (lSiteid, lMemberid, sSiteType, sContact, sActive, szUpdatedBy, dtupdate)
	select	a.lSiteid, b.lmemberid, a.sSiteType, 'Y', 'Y', 'dbconvert', getdate()
	from	tblLP_PartnerSite a, tblLP_PartnerSiteMember b
	where	a.sactive='Y'
	and		a.lSiteID = b.lSiteID
	and		a.lsiteid not in (select lsiteid from tblLP_PartnerSitemember)
	and		b.lmemberid not in (select lMemberid from tblLP_PartnerSitemember)
	*/
	
	/* MemberWebSite */
	update	c
	set		szWebURL = a.szSiteDirectoryURL
	from	tblLP_PartnerSiteDirectoryURL a
	join	tblLP_PartnerSiteMember b on (a.lSiteID = b.lSiteID and b.sContact = 'Y' and b.sActive='Y')
	join	tblLP_MemberWebsite c on (b.lMemberID = c.lMemberID)
	where	a.sActive='Y'
	and		c.szWebURL <> a.szSiteDirectoryURL

	insert	tblLP_MemberWebsite (lMemberid, szWebURL, sActive, szUpdatedBy, dtUpdate)
	select	b.lMemberid, a.szSiteDirectoryURL, 'Y' as sActive, 'DT_HouseCleaning' as szUpdatedBy, getdate() as dtUpdate
	from	tblLP_PartnerSiteDirectoryURL a
	join	tblLP_PartnerSiteMember b on (a.lSiteID = b.lSiteID and b.sContact = 'Y' and b.sActive='Y')
	left join tblLP_MemberWebsite c on (b.lMemberID = c.lMemberID)
	where	c.lMemberid is null
	and		a.sActive='Y'


/* Expired Orders */		
	/* Service Area */
	update	tblLP_AdServiceArea 
	set		sActive='N' 
	from	tblLP_ProductOrder a, tblLP_AdServiceArea b 
	where	a.ladvertiserid =b.ladvertiserid 
	and		a.lorderno=b.lorderno 
	and		a.sactive='N' 
	and		b.sActive='Y' 

	/* BusPhotofile */
	Update	tblLP_BusPhotofile
	set		sActive='N'
	from	tblLP_BusPhotofile a, tblLP_Productorder b
	where	a.ladvertiserid=b.ladvertiserid
	and		b.sActive='N' 
	and		dtEnd<getdate()
	and		a.sActive='Y' 
	and		a.ladvertiserid not in (select ladvertiserid from tblLP_Productorder where sactive='Y')

	/* BusListingStatus */
	/*
	update	a
	set		sStatus='DND', 
			dtStatus=getdate(), 
			szUpdatedBy='DT_HouseCleaning'
	from	tblLP_busListingStatus a
	join	tblLP_busListing b on (a.lAdvertiserID=b.lAdvertiserID and b.sAction='DND')
	where	a.sLastStatus='Y'
	and		a.sStatus<>'DND'
	*/
	
	/* Update Profile Database */
	/*
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
		update	b
		set		b.AgencyID = 'AF'
		from	tblLP_busListing a,	ListingStore..acx_tbl_listing b
		where	a.ridax = b.rid
		and		a.sAgencyID = 'AF'
		and		b.Agencyid = 'AP'
	else
		update	b
		set		b.AgencyID = 'AF'
		from	tblLP_busListing a,	ListingStore2..acx_tbl_listing b
		where	a.ridax = b.rid
		and		a.sAgencyID = 'AF'
		and		b.Agencyid = 'AP'
	*/
	
	EXEC msdb.dbo.sp_send_dbMail
		@profile_name = 'ReportingSvc', 
		@recipients ='sqlsupport@local.com',
		@subject='usp_DT_LocalPromote_HouseCleaning of LA3SQL01\TonyStark finished successfully'


END
GO
