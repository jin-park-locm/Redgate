SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_DT_tblCC_acxListing]
AS
BEGIN
	SET NOCOUNT ON;

	if exists (select 1 from sys.objects where name='tblCC_ListingProcess' and type='U')
		drop table tblCC_ListingProcess

	CREATE TABLE tblCC_ListingProcess(
		[lCCListingID] [int] NOT NULL,
		[RID] [int] NULL,
		[lAdvertiserID] [varchar](20) NULL,
		[AgencyID] [char](2) NULL,
		[Title] [varchar](150) NOT NULL,
		[Address] [varchar](100) NULL,
		[City] [varchar](50) NOT NULL,
		[State] [char](2) NULL,
		[ZipCode] [varchar](10) NULL,
		[Phone] [varchar](12) NULL,
		[URL] [varchar](250) NULL,
		[HideAddr] [char](1) NULL,
		[Action] [char](3) NOT NULL,
		[Confirm] [char](1) NOT NULL,
		[Latitude] decimal(12,9) NULL,
		[Longitude] decimal(12,9) NULL,
		[UpdateBy] [varchar](50) NOT NULL,
		[dtAdd] [datetime] NOT NULL,
		[dtTurn] [datetime] NULL
	) ON [PRIMARY]
	
	insert	tblCC_ListingProcess(lCCListingID,RID,lAdvertiserID,AgencyID,Title,Address,City,State,ZipCode,Phone,URL,HideAddr,Action,Confirm,UpdateBy,dtAdd,dtTurn)
	select	lCCListingID,RID,lAdvertiserID,sAgencyID,szTitle,szAddress,szCity,sState,szZip,szPhone,szURL,sHideAddr,sAction,sConfirm,sUpdate,dtAdd,dtTurn
	from	tblCC_acxListing
	where	sConfirm = 'Y' 
	
	/* Get RID from BusListing*/
	Update	a
	set		RID = b.RIDAX,
			AgencyID=b.sAgencyID
	--		select	a.RID, b.RIDAX
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (convert(int, a.lAdvertiserID) = b.lAdvertiserID)
	where	a.Confirm = 'Y' 
	--and		a.sAction = 'DEL'
	and		a.RID is null
	and		b.RIDAX is not null

	update	tblCC_ListingProcess
	set		RID = null
	where	RID = 0
	and		Confirm = 'Y'

	/* Update AdvertiserID from Profile Database*/
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
		update	a
		set		AgencyID = b.AgencyID, 
				lAdvertiserID = b.AdvertiserID
		--		select	a.*
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_listing b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.lAdvertiserID is null
	else
		update	a
		set		AgencyID = b.AgencyID, 
				lAdvertiserID = b.AdvertiserID
		--		select	a.*
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_listing b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.lAdvertiserID is null

	/* Mark P to discard previous actions in multiple actions */
	select	RID, MAX(lCCListingID) as lCCListingID
	into	#latestAction
	from	tblCC_ListingProcess 
	where	Confirm='Y' 
	group	by RID
	having	count(*) > 1

	update	a
	set		a.Confirm='P',dtTurn=GETDATE()
	--select *
	from	tblCC_ListingProcess a
	join	#latestAction b on (a.RID=b.RID)
	where	a.Confirm='Y'
	and		a.lCCListingID <> b.lCCListingID

	update	a
	set		a.sConfirm='P',dtTurn=GETDATE()
	--select *
	from	tblCC_acxBDC a
	join	#latestAction b on (a.RID=b.RID)
	where	a.sConfirm='Y'
	and		a.lCCListingID <> b.lCCListingID

	drop table #latestAction

	/* Listing tobe deleted has an active order - Mark V to discard from turn*/
	update	a
	set		Confirm = 'V'
	--		select	a.*
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.RID = b.ridax)
	join	tblLP_ProductOrder o on (o.lAdvertiserID = b.lAdvertiserID and o.sActive = 'Y')
	where	a.Confirm = 'Y'
	and		a.Action = 'DEL'

/* delete action */	
	/* Delete Reviews */
	Update	b
	set		sActive = 'D'
	--		select b.* 
	from	tblCC_ListingProcess a
	join	tblRW_LocalReview b on (a.rid = b.rid and b.sActive = 'Y')
	where	a.Confirm = 'Y'
	and		a.Action = 'DEL'
			
	/* Delete BusListing */
	Update	l
	set		sAction = 'DEL'
			, szUpdatedBy = 'DT_tblCC_'+cast(a.lCCListingID as varchar(20))
			, dtAction = getdate()
	--		select l.*
	from	tblLP_BusListing l
	join	tblCC_ListingProcess a on (a.rid = l.ridax and a.Confirm='Y' and a.Action='DEL')
	where	l.sAction <> 'DEL'

	Update	l
	set		sAction = 'DEL'
			, szUpdatedBy = 'DT_tblCC_'+cast(a.lCCListingID as varchar(20))
			, dtAction = getdate()
	--		select l.*
	from	tblLP_BusListing l
	join	tblCC_ListingProcess a on (a.ladvertiserid = l.ladvertiserid and a.Confirm='Y' and a.Action='DEL' and a.RID is null)
	where	l.sAction <> 'DEL'
	
	/* Delete BusListingStatus */
	update	s
	set		sLastStatus = 'N'
	--		select s.*
	from	tblCC_ListingProcess a 
	join	tblLP_BusListing b on (a.rid = b.ridax)
	join	tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action = 'DEL'
	and		s.sStatus <> 'DEL'
	
	update	s
	set		sLastStatus = 'N'
	--		select s.*
	from	tblCC_ListingProcess a 
	join	tblLP_BusListing b on (convert(int,a.ladvertiserid) = b.ladvertiserid) -- Instead of RID AID is used here.-- when there is no RID.  The problematic child indeed.
	join	tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.rid is null 
	and		a.confirm='Y'
	and		a.action = 'DEL'
	and		s.sStatus <> 'DEL'

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'DEL' as sStatus,'Y' as sLastStatus, 'Y' as sActive, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.rid = b.ridax)
	left join tblLP_BusListingstatus c on (b.lAdvertiserID=c.lAdvertiserID and c.sLastStatus='Y')
	where	a.confirm='Y'
	and		a.action='DEL'
	and		c.lAdvertiserID is null

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'DEL' as sStatus,'Y' as sLastStatus, 'Y' as sActive, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.ladvertiserid = b.ladvertiserid)
	left join tblLP_BusListingstatus c on (b.lAdvertiserID=c.lAdvertiserID and c.sLastStatus='Y')
	where	a.rid is null
	and		a.confirm='Y'
	and		a.action='DEL'
	and		c.lAdvertiserID is null

	/* Delete from Profile Database */
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
	begin
		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_Review b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_StarRating b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_MSContent b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_MSPhoto b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'
		
		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_ResultDesc b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_keyvalue b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_map_ListingBDC b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_map_ListingURL b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore..acx_tbl_Listing b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'
		
	end
	else
	begin
		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_Review b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_StarRating b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_MSContent b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_MSPhoto b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'
		
		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_ResultDesc b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_keyvalue b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_map_ListingBDC b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_map_ListingURL b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcess a
		join	ListingStore2..acx_tbl_Listing b on (a.rid = b.rid)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'
		
	end

/* Add or Update Action */
	/* Normalize */
	update	a
	set		ZipCode = ListingStoreMaster.dbo.glb_fn_normalizeZipCode(ZipCode),
			Phone = ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(Phone),
			Address = ListingStoreMaster.dbo.glb_fn_normalizeAddress(ListingStoreMaster.dbo.glb_fn_stripSpecialChars(Address)),
			Title = ListingStoreMaster.dbo.glb_fn_CapitalizeTitle(ListingStoreMaster.dbo.glb_fn_stripSpecialChars(Title))
	from	tblCC_ListingProcess a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'
	
	update	a
	set		State = ListingStoreMaster.dbo.glb_fn_normalizeState(State,ZipCode),
			City = ListingStoreMaster.dbo.glb_fn_NormalizeCity(City,ZipCode)
	from	tblCC_ListingProcess a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'

	update	a
	set		Address='Serving Your Area'
	from	tblCC_ListingProcess a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'
	and		isnull(Address,'')=''	

	update	a
	set		Confirm='B'	--BAD data
	from	tblCC_ListingProcess a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'
	and		(ZipCode is null or State is null or Phone is null or LEN(Title) < 2 or Title is null)

	/* BusListing */	
	update	b 
	set		b.sAgencyID = 'AF',
			b.szTitle = a.Title,
			b.szTitleSearch = ListingStoreMaster.dbo.glb_fn_titleSearch(a.Title),
			b.szTitleStrip = dbo.ufn_StrippingTitle(a.Title),
			b.szStreetName = a.Address,
			b.szCity = a.City,
			b.sState = a.State,
			b.sPostalCode = a.ZipCode,
			b.szPhone = a.Phone,
			b.szURL = a.URL,
			b.sHideAddress = a.HideAddr,
			b.dtAction = a.dtAdd,
			b.szUpdatedBy = 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)),
			b.saction = 'UPD'
	--select * 
	from	dbo.tblCC_ListingProcess a
	join	dbo.tblLP_BusListing b on (a.rid = b.ridax)
	where	isnull(a.rid, 0) <> 0
	and		isnull(b.ridax, 0) <> 0
	and		a.Confirm='Y'
	and		a.action<>'DEL'

	insert	tblLP_BusListing(lMemberID,sAgencyID,sztitle,szStreetName,szCity,sState,sPostalCode,lCountryID,szPhone,szURL,szEmail,sHideAddress,sAction,dtAction,dtListing1st,szUpdatedBy,szTitleSearch,szTitleStrip)
	select	CONVERT(int,UpdateBy),'AF',Title,Address,City,State,ZipCode,1,Phone,URL,'',HideAddr,'ADD',GETDATE(),GETDATE(),'DT_tblCC_'+cast(a.lCCListingID as varchar(20)),ListingStoreMaster.dbo.glb_fn_titleSearch(a.Title),dbo.ufn_StrippingTitle(a.Title)
	from	tblCC_ListingProcess a
	where	a.RID is null
	and		a.Confirm='Y'
	and		a.action<>'DEL'

	update	a
	set		a.lAdvertiserID=b.lAdvertiserID,
			a.AgencyID=b.sAgencyID
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.lCCListingID=CONVERT(int,replace(b.szUpdatedBy,'DT_tblCC_','')))
	where	a.Confirm='Y'
	and		a.action<>'DEL'
	and		b.szUpdatedBy like 'DT_tblCC_%'

	/* PartnerListing */
	insert	tblLP_PartnerListing(lSiteID,lAdvertiserID,sListingType,sActive,szUpdatedBy,dtActiveY)
	select	2,a.lAdvertiserID,'FRE','Y','DT_tblCC_'+cast(a.lCCListingID as varchar(20)),GETDATE()
	from	tblCC_ListingProcess a
	where	a.RID is null
	and		a.Confirm='Y'
	and		a.action<>'DEL'

	/* BusListingStatus */
	update	s
	set		sLastStatus = 'N'
	--		select s.*
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.rid = b.ridax)
	join	tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action<>'DEL'
	and		s.sStatus<>'APV'

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'APV' as sStatus,'Y' as sActive, 'Y' as sLastStatus, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.RID = b.RIDAX)
	left join tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action<>'DEL'
	and		s.lAdvertiserID is null

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'APV' as sStatus,'Y' as sActive, 'Y' as sLastStatus, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcess a
	join	tblLP_BusListing b on (a.lAdvertiserID = b.lAdvertiserID)
	left join tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action<>'DEL'
	and		a.RID is null
	and		s.lAdvertiserID is null

	/* Listing neither in LocalPromote nor NEW(Rid is null). Updates to Profile Database*/
	select  a.* into #UpdateProfileDatabase
	from	tblCC_ListingProcess a
	left join tblLP_BusListing b on (a.RID=b.RIDAX)
	where	a.Confirm='Y'
	and		a.action<>'DEL'
	and		a.RID is not null
	and		b.RIDAX is null

	/* Geocode */
	if exists (select 1 from sys.objects where name='tblCC_geocode' and type='U')
	drop table tblCC_geocode

	create table tblCC_geocode
	(
		RID varchar(20),
		Address varchar(128),
		City varchar(80),
		State varchar(10),
		Zipcode varchar(10),
		gConfidence varchar(20),
		gEntity varchar(30),
		gLatitude varchar(30),
		gLongitude varchar(30),
		gAddress varchar(128),
		gCity varchar(80),
		gState varchar(10),
		gZipcode varchar(10)
	)

	update	a
	set		a.Latitude=coalesce(a.latitude,z.latitude*pi()/180,0),
			a.longitude=coalesce(a.longitude,z.longitude*pi()/180,0)
	from	#UpdateProfileDatabase a
	left join zipcodes z on (a.zipcode=z.zipcode and z.CityType='D')
	where	(Address like 'Serving %' or Address like 'PO Box%')

	select	Rid,ListingStoreMaster.dbo.glb_fn_AddressLine1(Address) as Address,city,state,zipcode
	into	#tmpCC_geo
	from	#UpdateProfileDatabase 
	where	Address not like 'Serving %' and Address not like 'PO Box%'

	update	a
	set		a.Latitude=g.Latitude,a.Longitude=g.Longitude
	from	#UpdateProfileDatabase a 
	join	#tmpCC_geo c on (a.RID=c.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	delete	c 
	from	#tmpCC_geo c 
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	insert	tblCC_geocode
	exec	ListingStoreMaster.dbo.glb_procMQ_geocode 'localpromote..#tmpCC_geo'

	delete	c 
	from	#tmpCC_geo c 
	join	tblCC_geocode b on (c.RID=b.RID)

	update	a 
	set		a.latitude=b.gLatitude,
			a.longitude=b.gLongitude
	from	#UpdateProfileDatabase a
	join	tblCC_geocode b on a.RID=b.RID
	where	(b.gConfidence like '[BILPZ][1-3]_AA' or b.gConfidence like '[BLPI][1-3]AA_' or b.gConfidence like '[BLPI][1-3]A_A' or b.gConfidence like '[LP]1BBA')

	update	a 
	set		a.latitude=coalesce(a.latitude,z.latitude*pi()/180,0),
			a.longitude=coalesce(a.longitude,z.longitude*pi()/180,0)
	from	#UpdateProfileDatabase a
	join	tblCC_geocode b on a.RID=b.RID
	left join zipcodes z on (a.ZipCode=z.ZIPCode and z.CityType='D')
	where	b.gConfidence not like '[BILPZ][1-3]_AA'
	and		b.gConfidence not like '[BLPI][1-3]AA_'
	and		b.gConfidence not like '[BLPI][1-3]A_A'
	and		b.gConfidence not like '[BLPI][1-3]_AA'
	and		b.gConfidence not like '[LP]1BBA'

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode(Address,City,State,Zipcode,Latitude,Longitude,Confidence,Entity,dtUpdate)
	select	distinct a.Address,a.City,a.State,a.Zipcode,convert(decimal(12,9),a.gLatitude),convert(decimal(12,9),a.gLongitude),a.gConfidence,a.gEntity,getdate() 
	from	tblCC_geocode a
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode b on (a.zipcode=b.zipcode and a.Address=b.Address and a.City=b.City and a.State=b.State)
	where	b.Address is null
	and		(a.gConfidence like '[BILPZ][1-3]_AA' or a.gConfidence like '[BLPI][1-3]AA_' or a.gConfidence like '[BLPI][1-3]A_A' or a.gConfidence like '[LP]1BBA')

	update	b
	set		address=ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address),city=a.city,state=a.state,zipcode=a.zipcode,latitude=a.latitude,longitude=a.longitude,AgencyID=a.AgencyID,AdvertiserID=a.lAdvertiserID
	from	#tmpCC_geo t 
	join	#UpdateProfileDatabase a on (a.RID=t.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.RID=b.RID

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode(RID,address,city,state,zipcode,latitude,longitude,AgencyID,AdvertiserID)
	select	a.Rid,ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address) as Address,a.city,a.state,a.zipcode,a.latitude,a.longitude,a.AgencyID,a.lAdvertiserID 
	from	#UpdateProfileDatabase a 
	join	#tmpCC_geo t on a.RID=t.RID
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.RID=b.RID
	where	b.RID is null

	drop table #tmpCC_geo
	
	/* Update Profile Database */
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
	begin
		update	a
		set		a.Title = b.Title,
				a.Address = b.Address,
				a.City = b.City,
				a.State = b.State,
				a.ZipCode = b.ZipCode,
				a.PhoneNumber = b.Phone,
				a.URL = b.URL,
				a.Latitude = b.Latitude,
				a.Longitude = b.Longitude
		from	ListingStore..acx_tbl_listing a
		join	#UpdateProfileDatabase b on (a.RID=b.RID)
		
		update	a
		set		a.Url=b.URL
		from	ListingStore..acx_map_listingURL a
		join	#UpdateProfileDatabase b on (a.RID=b.RID and a.AgencyId=b.AgencyID)
		where	ISNULL(b.URL,'')<>''
		and		a.Identifier not in ('PYID')

		insert	ListingStore..acx_map_listingURL(ListingId,RID,Identifier,URL,DisplayUrl,DtAdd,PartnerRID,AgencyId,PriorityID,PositionCode,URLType)
		select	c.ListingId,a.RID,'Acxiom',a.URL,null,GETDATE(),a.lAdvertiserID,a.AgencyID,0,'TP','ML'
		from	#UpdateProfileDatabase a
		join	ListingStore..acx_tbl_listing c on (a.RID=c.RID)
		left join ListingStore..acx_map_listingURL b on (a.RID=b.RID and b.AgencyId=a.AgencyID)
		where	b.RID is null
		and		ISNULL(a.URL,'')<>''

	end
	else
	begin
		update	a
		set		a.Title = b.Title,
				a.Address = b.Address,
				a.City = b.City,
				a.State = b.State,
				a.ZipCode = b.ZipCode,
				a.PhoneNumber = b.Phone,
				a.URL = b.URL,
				a.Latitude = b.Latitude,
				a.Longitude = b.Longitude
		from	ListingStore2..acx_tbl_listing a
		join	#UpdateProfileDatabase b on (a.RID=b.RID)

		update	a
		set		a.Url=b.URL
		from	ListingStore2..acx_map_listingURL a
		join	#UpdateProfileDatabase b on (a.RID=b.RID and a.AgencyId=b.AgencyID)
		where	ISNULL(b.URL,'')<>''
		and		a.Identifier not in ('PYID')

		insert	ListingStore2..acx_map_listingURL(ListingId,RID,Identifier,URL,DisplayUrl,DtAdd,PartnerRID,AgencyId,PriorityID,PositionCode,URLType)
		select	c.ListingId,a.RID,'Acxiom',a.URL,null,GETDATE(),a.lAdvertiserID,a.AgencyID,0,'TP','ML'
		from	#UpdateProfileDatabase a
		join	ListingStore2..acx_tbl_listing c on (a.RID=c.RID)
		left join ListingStore2..acx_map_listingURL b on (a.RID=b.RID and b.AgencyId=a.AgencyID)
		where	b.RID is null
		and		ISNULL(a.URL,'')<>''
		
	end

	/* acxBDC Get RID from acxListing */
	update	tblCC_acxBDC
	set		RID = a.RID
	-- select b.* 
	from	tblCC_ListingProcess a
	join	tblCC_acxBDC b on (a.lCCListingID = b.lCCListingID)
	where	a.Confirm = 'Y'
	and		b.sConfirm = 'Y'
	and		b.RID is null

	/*  Mark P for previous actions for multiple actions  */
	update	b
	set		b.sConfirm='P',b.dtTurn=GETDATE()
	from	dbo.tblCC_acxBDC b
	join	(select	rid, lCCListingID
			from	dbo.tblCC_acxBDC b
			where	sConfirm ='Y'
			and		RID is not null 
			group	by RID, lCCListingID
			having	count(*) > 1 and lCCListingID<>MAX(lCCListingID)
			) a on (a.RID=b.RID and a.lCCListingID=b.lCCListingID)

	update	a
	set		a.sConfirm ='E',a.dtTurn=GETDATE() --Existing
	--		select	a.*
	from	dbo.tblCC_acxBDC a
	join	dbo.tblCC_acxBDC b on (a.RID=b.RID and a.lCCListingID=b.lCCListingID and a.BDC=b.BDC)
	where	a.sConfirm='Y'
	and		b.sConfirm='Y'
	and		a.sDBState<>b.sDBState
	
	/* BusListingCat */
	insert	tblLP_BusListingCat (ladvertiserID, BDC, sAction, szUpdatedBy, dtUpdate)
	select	b.ladvertiserID, a.BDC,'ADD','DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtUpdate 
	from	dbo.tblCC_acxBDC a
	join	glb_tbl_BDC g on a.BDC=g.BDC
	join	dbo.tblLP_BusListing b on a.rid = b.ridax
	left join tblLP_BusListingCat c on (c.lAdvertiserID=b.lAdvertiserID and c.BDC=a.BDC)
	where	a.sConfirm ='Y'
	and		a.sdbState='NEW'
	and		c.ladvertiserID is null

	insert	tblLP_BusListingCat (ladvertiserID, BDC, sAction, szUpdatedBy, dtUpdate)
	select	b.ladvertiserID, a.BDC,'ADD','DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtUpdate 
	from	dbo.tblCC_acxBDC a
	join	dbo.tblCC_ListingProcess b on (a.lCCListingID=b.lCCListingID)
	join	glb_tbl_BDC g on a.BDC=g.BDC
	join	dbo.tblLP_BusListing l on b.lAdvertiserID = l.lAdvertiserID
	left join tblLP_BusListingCat c on (c.lAdvertiserID=b.lAdvertiserID and c.BDC=a.BDC)
	where	a.sConfirm ='Y'
	and		a.sdbState='NEW'
	and		a.RID is null
	and		b.Action='ADD'
	and		c.ladvertiserID is null

	update	b
	set		b.saction='DEL'
	from	tblLP_BusListingCat b
	join	tblLP_BusListing a on (a.lAdvertiserID=b.lAdvertiserID)
	join	tblCC_acxBDC c on (a.RIDAX=c.RID and b.BDC=c.BDC)
	where	c.sConfirm ='Y'
	and		c.sdbState='OLD'
	
	/* Update Profile Database */
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
	begin
		delete	a
		from	ListingStore..acx_map_ListingBDC a
		join	#UpdateProfileDatabase b on (a.RID=b.RID)
		join	tblCC_acxBDC c on (b.lCCListingID=b.lCCListingID)
		where	c.sConfirm ='Y'
		and		c.sdbState='OLD'

		insert	ListingStore..acx_map_ListingBDC (RID,ListingID,BDC,BDCOrig,col,dtAdd,PartnerRID,AgencyID)
		select	c.RID,a.ListingID,c.BDC,c.BDC,1,GETDATE(),b.lAdvertiserID,b.AgencyID
		from	#UpdateProfileDatabase b 
		join	ListingStore..acx_tbl_Listing a on (b.RID=a.RID)
		join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID)
		where	c.sConfirm ='Y'
		and		c.sdbState='NEW'
	end
	else
	begin
		delete	a
		from	ListingStore2..acx_map_ListingBDC a
		join	#UpdateProfileDatabase b on (a.RID=b.RID)
		join	tblCC_acxBDC c on (b.lCCListingID=b.lCCListingID)
		where	c.sConfirm ='Y'
		and		c.sdbState='OLD'

		insert	ListingStore2..acx_map_ListingBDC (RID,ListingID,BDC,BDCOrig,col,dtAdd,PartnerRID,AgencyID)
		select	c.RID,a.ListingID,c.BDC,c.BDC,1,GETDATE(),b.lAdvertiserID,b.AgencyID
		from	#UpdateProfileDatabase b 
		join	ListingStore2..acx_tbl_Listing a on (b.RID=a.RID)
		join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID)
		where	c.sConfirm ='Y'
		and		c.sdbState='NEW'
	end

	/* update Turn Flag */
	Update	a 
	set		a.sConfirm = case when b.Confirm='Y' then 'T' else b.Confirm end,
			a.RID = b.RID,
			a.lAdvertiserID = b.lAdvertiserID,
			a.sAgencyID = b.AgencyID, 
			a.dtTurn = getdate()
	from	tblCC_acxListing a
	join	tblCC_ListingProcess b on (a.lCCListingID=b.lCCListingID)
	where	a.sConfirm='Y'

	update	a
	set		a.sConfirm = case when b.Confirm='Y' then 'T' else b.Confirm end, 
			a.RID = b.RID,
			a.dtTurn = getdate()
	from	tblCC_acxBDC a
	join	tblCC_ListingProcess b on (a.RID = b.RID)
	where	a.sConfirm ='Y'

	drop table #UpdateProfileDatabase

	EXEC msdb.dbo.sp_send_dbMail
		@profile_name = 'ReportingSvc', 
		@recipients ='sqlsupport@local.com',
		@subject='usp_DT_tblCC_acxListing of LA3SQL01\TonyStark finished successfully'

END


GO
