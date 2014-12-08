SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_DT_LocalAdDistribution_update]
AS
BEGIN
	SET NOCOUNT ON;

	/* Expired AdDistribution */	
	Update	a
	Set		sActive = 'N'
	-- select d.* 
	from	tblLP_AdDistribution a
	left join tblLP_ProductOrder b on (a.lOrderNo=b.lOrderNo and b.sActive='Y')
	where	a.sActive = 'Y'
	and		b.lOrderNo is null 

	update	tblLP_AdDistribution
	set		sActive = 'N'
	where	sActive = 'Y'
	and		lSiteID in (select lSiteID from tblLP_PartnerSite where sActive = 'N')

	/*
	insert	tblLP_AdDistribution (ladvertiserid,	lSiteID,	lOrderNo,	lAdServiceType,	sActive,	szUpdatedBy,	dtUpdate)
	select	a.ladvertiserid, b.lSiteID, a.lOrderNo, 2 as lAdServiceType, 'Y' as sActive, 'DT_HouseCleaning', getdate()
	from	tblLP_ProductOrder a
	join	tblLP_ProductCampaign b on (b.lCIDNo = a.lCIDNo and a.sActive='Y')
	left join tblLP_AdDistribution c on (a.lOrderNo = c.lOrderNo)
	where	c.lOrderNo is null
	--and		a.lCIDNo <> 2540
	*/
	
	/* Update AdDistribution */
	select	*
	into	#tempAdDist
	from	
	(
		select	l.ladvertiserid, c.lSiteID, o.lOrderNo
		from	tblLP_BusListing l
		join	tblLP_ProductOrder o on (o.lAdvertiserID = l.lAdvertiserID and o.sActive = 'Y')
		join	tblLP_ProductCampaign c on (c.lCIDNo = o.lCIDNo)
		join	tblLP_PartnerSite s on (s.lSiteID = c.lSiteID and s.lDistTypeid = 1) --(Site Distribution)
	
		union

		select	l.ladvertiserid, ps.lSiteID, o.lOrderNo
		from	tblLP_BusListing l
		join	tblLP_ProductOrder o on (o.lAdvertiserID = l.lAdvertiserID and o.sActive = 'Y')
		join	tblLP_ProductCampaign c on (c.lCIDNo = o.lCIDNo)
		join	tblLP_PartnerSite s on (s.lSiteID = c.lSiteID and s.lDistTypeid = 2) --(Partner Distribution)
		join	tblLP_PartnerSite ps on (ps.lPartnerID = s.lPartnerID)
	) X

	-- other local sites
	Select	b.lsiteid 
	into	#tempADInLocm
	from	tblLP_MemberWebsite a
	join	tblLP_PartnerSiteMember c on (a.lmemberid=c.lmemberid and c.sContact='Y')
	join	tblLP_PartnerSite b on (c.lSiteID=b.lSiteID and b.sActive='Y')
	where	b.lSiteID > 2
	AND		(replace(replace(replace(replace(a.szWebURL,'http://',''),'/',''),'.com',''), 'www.', '')) ='local'

	-- distribute to local.com from other local sites
	insert	#tempAdDist (ladvertiserid, lSiteID, lOrderNo)		
	select	n.ladvertiserid, 2 as lSiteID, n.lOrderNo
	from	#tempAdDist n
	join	#tempADInLocm t on t.lSiteID = n.lSiteID  
	left join #tempAdDist m on (m.lAdvertiserID = n.lAdvertiserID and m.lSiteID = 2)
	where	m.lAdvertiserID is null

	-- mark 'N' for inactive Orders
	update	d
	set		sActive = 'N'		
	from	tblLP_AdDistribution d
	left	join #tempAdDist n 	on (n.lAdvertiserID = d.lAdvertiserID and n.lOrderNo = d.lOrderNo and n.lSiteID = d.lSiteID)
	where	d.sActive =  'Y'
	and		n.lAdvertiserID is null	

	-- mark 'Y' for active Orders
	update	d
	set		sActive = 'Y',szUpdatedBy='DT-LAC-Update',dtUpdate=GETDATE()		
	from	tblLP_AdDistribution d
	join	#tempAdDist n on (n.lAdvertiserID = d.lAdvertiserID and n.lOrderNo = d.lOrderNo and n.lSiteID = d.lSiteID)
	where	d.sActive =  'N'

	-- insert new ones
	insert	tblLP_AdDistribution (ladvertiserid, lSiteID, lOrderNo, lAdServiceType,	sActive, szUpdatedBy, dtUpdate)
	select	n.ladvertiserid, n.lSiteID, n.lOrderNo, 2, 'Y', 'DT-LAC-Update', GETDATE()
	from	#tempAdDist n 
	left join tblLP_AdDistribution d on (n.lAdvertiserID = d.lAdvertiserID and n.lOrderNo = d.lOrderNo and n.lSiteID = d.lSiteID)
	where	d.ladvertiserid is null

	drop	table #tempAdDist
	drop	table #tempADInLocm
	
	EXEC msdb.dbo.sp_send_dbMail
	@profile_name = 'ReportingSvc', 
	@recipients ='sqlsupport@local.com',
	@subject='usp_DT_LocalAdDistribution_update of LA3SQL01\TonyStark finished successfully'

END
GO
