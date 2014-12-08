SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[usp_Rpt_AlignPartnerListing]
/**********************************************************************************
EXAMPLES: 	exec usp_Rpt_AlignPartnerListing
**********************************************************************************/
as 
BEGIN
	set nocount on

	-- Get all the listing with active order

	select	identity(int, 1,1) as ID, l.lAdvertiserID, o.lOrderNo, c.lSiteID, o.dtBeginning, o.mPaidFee
	into	#TemActiveListing
	from	tblLP_BusListing l
	inner	join tblLP_ProductOrder o 
	on		l.lAdvertiserID = o.lAdvertiserID 
			--and l.sAction in ('Add', 'APV', 'BLL', 'BPH', 'BZP', 'TRN', 'UPD')
			and o.sActive = 'Y'
			and	o.mPaidFee > 0.5
	inner	join tblLP_ProductCampaign c 
	on		o.lCIDNo = c.lCIDNo
	order	by l.lAdvertiserID, o.lOrderNo desc

	select	* 
	into	#tem
	from	#TemActiveListing
	where	lAdvertiserID in (
						select	lAdvertiserID
						from	#TemActiveListing 
						group	by lAdvertiserID
						having	count(1) > 1
					)

	delete	al
	--		select	* 
	from	#TemActiveListing al
	inner	join (
					select	* 
					from	#tem 
					where	ID not in (		
									select max(ID) from #tem
									group by lAdvertiserID	
								)	
				) as at
	on		at.ID = al.ID
	
	-- Active Product Order does not have an active entry in Partner listing 

	select	AL.lAdvertiserID, AL.lSiteID
	into	#temSiteNoPL
	from	#TemActiveListing AL
	left	join tblLP_PartnerListing p
	on		AL.lAdvertiserID = p.lAdvertiserID and AL.lSiteID = p.lSiteID
			and p.sListingType = 'PAY' and p.sActive = 'Y'
	where	p.lAdvertiserID is null
	
	insert	into tblLP_PartnerListing_UpdSiteID_Log
			(lSiteID, lAdvertiserID, sListingType, sActive, szUpdatedBy, dtActiveY, dtActiveN, 
			NewSiteID, dtUpdate)	
	select	p.lSiteID, p.lAdvertiserID, p.sListingType, p.sActive, 
			p.szUpdatedBy, p.dtActiveY, p.dtActiveN, 
			isnull(a.lSiteID, 0) as NewSiteID,
			getdate() as dtUpdate
	from	#temSiteNoPL a
	left	join tblLP_PartnerListing p
	on		a.lAdvertiserID = p.lAdvertiserID
	and		p.sListingType = 'PAY'

	If exists (select * from sysobjects where name = 'zTmp_SiteNoPartnerListing')
		drop table zTmp_SiteNoPartnerListing

	select	isnull(p.lAdvertiserID, 0) as AdvertiserID, 
			isnull(p.lSiteID, 0) as OldSiteID, 
			convert(varchar(10), isnull(p.sListingType, '')) as ListingType, 
			isnull(PL.lSiteID, 0) as NewSiteID
	into	zTmp_SiteNoPartnerListing
	from	tblLP_PartnerListing p
	inner	join #temSiteNoPL PL
	on		p.lAdvertiserID = PL.lAdvertiserID
	and		p.sListingType = 'PAY'

	Update	p
	set		lSiteID = PL.lSiteID
			, sActive = 'Y'
			, szUpdatedBy = 'dbo'
			, dtActiveN = NULL	
	--		select	p.*
	from	tblLP_PartnerListing p
	inner	join #temSiteNoPL PL
	on		p.lAdvertiserID = PL.lAdvertiserID
	and		p.sListingType = 'PAY'

	insert	into tblLP_PartnerListing
			(lSiteID, lAdvertiserID, sListingType, sActive, szUpdatedBy, dtActiveY)			
	select	t.lSiteID, t.lAdvertiserID, 'PAY', 'Y', 'dbo', getdate()
	from	#temSiteNoPL t
	left	join tblLP_PartnerListing p
	on		t.lAdvertiserID = p.lAdvertiserID
			and t.lSiteID = p.lSiteID
			and p.sListingType = 'PAY'  
	where	p.lSiteID is null

	select	p.lAdvertiserID,p.lSiteID 
	into	#temNoOrder
	from	tblLP_PartnerListing p
	left	join
			(
			select	l.lAdvertiserID, c.lSiteID
			from	tblLP_BusListing l
			inner	join tblLP_ProductOrder o 
			on		l.lAdvertiserID = o.lAdvertiserID 
					--and l.sAction in ('Add', 'APV', 'BLL', 'BPH', 'BZP', 'TRN', 'UPD')
					and o.sActive = 'Y'
			inner	join tblLP_ProductCampaign c 
			on		o.lCIDNo = c.lCIDNo
			) AL
	on		p.lAdvertiserID = AL.lAdvertiserID and p.lSiteID = AL.lSiteID 
	where	AL.lAdvertiserID is null
	and		p.sListingType = 'PAY' and p.sActive = 'Y' 

	Update	p
	set		sActive = 'N'
			,szUpdatedBy = 'dbo'
	--		select	p.*
	from	tblLP_PartnerListing p
	inner	join #temNoOrder PL
	on		p.lAdvertiserID = PL.lAdvertiserID AND p.lSiteID=pl.lSiteID
	and		p.sListingType = 'PAY'

	--activate FRE for unpaid
	Update	b
	set		sActive='Y', dtActiveY=getdate() 
	From	tblLP_PartnerListing b
	join	#temNoOrder a on (a.lAdvertiserid=b.ladvertiserid and b.sActive='N' and b.sListingType='FRE')
	where	NOT EXISTS (SELECT 1 FROM tblLP_PartnerListing WHERE lAdvertiserID=a.lAdvertiserID AND sListingType='PAY' AND sActive='Y')

	--insert active FRE for unpaid
	Insert	tblLP_PartnerListing (lSiteID, lAdvertiserid, sActive, szUpdatedBy, dtActiveY, dtActiveN,sListingType)
	Select	2, a.lAdvertiserID, 'Y' as sActive, 'dbo', getdate(), null, 'FRE'
	From	#temNoOrder a 
	LEFT JOIN tblLP_PartnerListing b on (a.lAdvertiserid=b.ladvertiserid and b.sActive='Y' and b.sListingType='FRE')
	where	b.lAdvertiserID IS null
	and		NOT EXISTS (SELECT 1 FROM tblLP_PartnerListing WHERE lAdvertiserID=a.lAdvertiserID AND sListingType='PAY' AND sActive='Y')


	update	zTmp_SiteNoPartnerListing 
	set 	ListingType='"'+convert(varchar(8),replace(ltrim(rtrim(ListingType)),'"',' '))+'"'
					
	exec master.dbo.xp_cmdshell 'echo AdvertiserID,OldSiteID,ListingType,NewSiteID>>"\\Republic\public\ReportExport\PartnerListingAllignment\header.txt"'
	exec master.dbo.xp_cmdshell 'bcp "select * from LocalPromote.dbo.zTmp_SiteNoPartnerListing" queryout \\Republic\public\ReportExport\PartnerListingAllignment\plns.txt -c -t, -T -Sla3sql01\tonystark'

	declare @command varchar(1000)
	declare @file varchar(100)
	declare @rundate datetime
	declare @postdate varchar(11)

	set @rundate = getdate()
	set @postdate = replace(convert (varchar(10), @rundate, 120),'-','')
	set @file='\\Republic\public\ReportExport\PartnerListingAllignment\PartnerListingAllignment_Report_'+@postdate+'.csv'
	-- print @file

	set @command = 'copy "\\Republic\public\ReportExport\PartnerListingAllignment\header.txt"+"\\Republic\public\ReportExport\PartnerListingAllignment\plns.txt" "'+@file+'"'
	-- print @command
	exec master.dbo.xp_cmdshell @command

	exec master.dbo.xp_cmdshell 'del \\Republic\public\ReportExport\PartnerListingAllignment\plns.txt'
	exec master.dbo.xp_cmdshell 'del \\Republic\public\ReportExport\PartnerListingAllignment\header.txt'

	drop table zTmp_SiteNoPartnerListing

	drop table #temNoOrder
	drop table #temSiteNoPL
	drop table #tem
	drop table #TemActiveListing
END


GO
