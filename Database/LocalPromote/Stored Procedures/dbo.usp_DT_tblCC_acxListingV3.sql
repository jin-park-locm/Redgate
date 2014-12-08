SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_DT_tblCC_acxListingV3]
AS
BEGIN
	SET NOCOUNT ON;

	if exists (select 1 from sys.objects where name='tblCC_ListingProcessV3' and type='U')
		drop table tblCC_ListingProcessV3

	CREATE TABLE tblCC_ListingProcessV3(
		[lCCListingID] [int] NOT NULL,
		[LocalID] [int] NULL,
		[AdvertiserID] [varchar](20) NULL,
		[AgencyID] [char](2) NULL,
		[Title] [varchar](150) NOT NULL,
		[Address] [varchar](100) NULL,
		[City] [varchar](50) NOT NULL,
		[County] [varchar](255) NULL,
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
	
	insert	tblCC_ListingProcessV3(lCCListingID,LocalID,AdvertiserID,AgencyID,Title,Address,City,State,ZipCode,Phone,URL,HideAddr,Action,Confirm,UpdateBy,dtAdd,dtTurn)
	select	lCCListingID,RID,lAdvertiserID,sAgencyID,szTitle,szAddress,szCity,sState,szZip,szPhone,szURL,sHideAddr,sAction,sConfirm,sUpdate,dtAdd,dtTurn
	from	tblCC_acxListing
	where	sConfirm = 'Y' 
	
	/* Get RID from BusListing*/
	Update	a
	set		LocalID = b.RIDAX,
			AgencyID=b.sAgencyID
	--		select	a.RID, b.RIDAX
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (convert(int, a.AdvertiserID) = b.lAdvertiserID)
	where	a.Confirm = 'Y' 
	--and		a.sAction = 'DEL'
	and		a.LocalID is null
	and		b.RIDAX is not null

	update	tblCC_ListingProcessV3
	set		LocalID = null
	where	LocalID = 0
	and		Confirm = 'Y'

	/* Update AdvertiserID from Profile Database*/
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
		update	a
		set		AgencyID = b.AgencyID, 
				AdvertiserID = b.AdvertiserID
		--		select	a.*
		from	tblCC_ListingProcessV3 a
		join	ListingStore..ListingV3 b on (a.LocalID = b.LocalID)
		where	a.Confirm = 'Y'
		and		a.AdvertiserID is null
	else
		update	a
		set		AgencyID = b.AgencyID, 
				AdvertiserID = b.AdvertiserID
		--		select	a.*
		from	tblCC_ListingProcessV3 a
		join	ListingStore2..ListingV3 b on (a.LocalID = b.LocalID)
		where	a.Confirm = 'Y'
		and		a.AdvertiserID is null

	/* Mark P to discard previous actions in multiple actions */
	select	LocalID, MAX(lCCListingID) as lCCListingID
	into	#latestAction
	from	tblCC_ListingProcessV3 
	where	Confirm='Y' 
	group	by LocalID
	having	count(*) > 1

	update	a
	set		a.Confirm='P',dtTurn=GETDATE()
	--select *
	from	tblCC_ListingProcessV3 a
	join	#latestAction b on (a.LocalID=b.LocalID)
	where	a.Confirm='Y'
	and		a.lCCListingID <> b.lCCListingID

	update	a
	set		a.sConfirm='P',dtTurn=GETDATE()
	--select *
	from	tblCC_acxBDC a
	join	#latestAction b on (a.RID=b.LocalID)
	where	a.sConfirm='Y'
	and		a.lCCListingID <> b.lCCListingID

	drop table #latestAction

	/* Listing tobe deleted has an active order - Mark V to discard from turn*/
	update	a
	set		Confirm = 'V'
	--		select	a.*
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.LocalID = b.ridax)
	join	tblLP_ProductOrder o on (o.lAdvertiserID = b.lAdvertiserID and o.sActive = 'Y')
	where	a.Confirm = 'Y'
	and		a.Action = 'DEL'

/* delete action */	
	/* Delete Reviews */
	Update	b
	set		sActive = 'D'
	--		select b.* 
	from	tblCC_ListingProcessV3 a
	join	tblRW_LocalReview b on (a.LocalID = b.rid and b.sActive = 'Y')
	where	a.Confirm = 'Y'
	and		a.Action = 'DEL'
			
	/* Delete BusListing */
	Update	l
	set		sAction = 'DEL'
			, szUpdatedBy = 'DT_tblCC_'+cast(a.lCCListingID as varchar(20))
			, dtAction = getdate()
	--		select l.*
	from	tblLP_BusListing l
	join	tblCC_ListingProcessV3 a on (a.LocalID = l.ridax and a.Confirm='Y' and a.Action='DEL')
	where	l.sAction <> 'DEL'

	Update	l
	set		sAction = 'DEL'
			, szUpdatedBy = 'DT_tblCC_'+cast(a.lCCListingID as varchar(20))
			, dtAction = getdate()
	--		select l.*
	from	tblLP_BusListing l
	join	tblCC_ListingProcessV3 a on (a.advertiserid = l.ladvertiserid and a.Confirm='Y' and a.Action='DEL' and a.LocalID is null)
	where	l.sAction <> 'DEL'
	
	/* Delete BusListingStatus */
	update	s
	set		sLastStatus = 'N'
	--		select s.*
	from	tblCC_ListingProcessV3 a 
	join	tblLP_BusListing b on (a.LocalID = b.ridax)
	join	tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action = 'DEL'
	and		s.sStatus <> 'DEL'
	
	update	s
	set		sLastStatus = 'N'
	--		select s.*
	from	tblCC_ListingProcessV3 a 
	join	tblLP_BusListing b on (convert(int,a.advertiserid) = b.ladvertiserid) -- Instead of RID AID is used here.-- when there is no RID.  The problematic child indeed.
	join	tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.LocalID is null 
	and		a.confirm='Y'
	and		a.action = 'DEL'
	and		s.sStatus <> 'DEL'

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'DEL' as sStatus,'Y' as sLastStatus, 'Y' as sActive, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.LocalID = b.ridax)
	left join tblLP_BusListingstatus c on (b.lAdvertiserID=c.lAdvertiserID and c.sLastStatus='Y')
	where	a.confirm='Y'
	and		a.action='DEL'
	and		c.lAdvertiserID is null

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'DEL' as sStatus,'Y' as sLastStatus, 'Y' as sActive, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.advertiserid = b.ladvertiserid)
	left join tblLP_BusListingstatus c on (b.lAdvertiserID=c.lAdvertiserID and c.sLastStatus='Y')
	where	a.LocalID is null
	and		a.confirm='Y'
	and		a.action='DEL'
	and		c.lAdvertiserID is null

	/* Delete from Profile Database */
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
	begin
		delete	b
		from	tblCC_ListingProcessV3 a
		join	ListingStore..ListingV3_keyvalue b on (a.LocalID = b.LocalID)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcessV3 a
		join	ListingStore..ListingV3 b on (a.LocalID = b.LocalID)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'
		
	end
	else
	begin
		delete	b
		from	tblCC_ListingProcessV3 a
		join	ListingStore2..ListingV3_keyvalue b on (a.LocalID = b.LocalID)
		where	a.Confirm = 'Y'
		and		a.Action = 'DEL'

		delete	b
		from	tblCC_ListingProcessV3 a
		join	ListingStore2..ListingV3 b on (a.LocalID = b.LocalID)
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
	from	tblCC_ListingProcessV3 a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'
	
	update	a
	set		State = ListingStoreMaster.dbo.glb_fn_normalizeState(State,ZipCode),
			City = ListingStoreMaster.dbo.glb_fn_NormalizeCity(City,ZipCode)
	from	tblCC_ListingProcessV3 a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'

	update	a
	set		a.County = b.CountyName+' County'
	from	tblCC_ListingProcessV3 a
	join	ListingStoreMaster..zipcodes b ON (a.zipcode=b.zipcode AND b.CityType='D')
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'

	update	a
	set		Address='Serving Your Area'
	from	tblCC_ListingProcessV3 a
	where	a.Confirm='Y'
	and		a.Action <> 'DEL'
	and		isnull(Address,'')=''	

	update	a
	set		Confirm='B'	--BAD data
	from	tblCC_ListingProcessV3 a
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
	from	dbo.tblCC_ListingProcessV3 a
	join	dbo.tblLP_BusListing b on (a.LocalID = b.ridax)
	where	isnull(a.LocalID, 0) <> 0
	and		isnull(b.ridax, 0) <> 0
	and		a.Confirm='Y'
	and		a.action<>'DEL'
	and		NOT EXISTS (SELECT 1 FROM tblLP_ProductOrder WHERE lAdvertiserID=b.lAdvertiserID AND sActive='Y') --do not touch premium

	insert	tblLP_BusListing(lMemberID,sAgencyID,sztitle,szStreetName,szCity,sState,sPostalCode,lCountryID,szPhone,szURL,szEmail,sHideAddress,sAction,dtAction,dtListing1st,szUpdatedBy,szTitleSearch,szTitleStrip)
	select	CONVERT(int,UpdateBy),'AF',Title,Address,City,State,ZipCode,1,Phone,URL,'',HideAddr,'ADD',GETDATE(),GETDATE(),'DT_tblCC_'+cast(a.lCCListingID as varchar(20)),ListingStoreMaster.dbo.glb_fn_titleSearch(a.Title),dbo.ufn_StrippingTitle(a.Title)
	from	tblCC_ListingProcessV3 a
	where	a.LocalID is null
	and		a.Confirm='Y'
	and		a.action<>'DEL'

	update	a
	set		a.AdvertiserID=b.lAdvertiserID,
			a.AgencyID=b.sAgencyID
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.lCCListingID=CONVERT(int,replace(b.szUpdatedBy,'DT_tblCC_','')))
	where	a.Confirm='Y'
	and		a.action<>'DEL'
	and		b.szUpdatedBy like 'DT_tblCC_%'

	/* PartnerListing */
	insert	tblLP_PartnerListing(lSiteID,lAdvertiserID,sListingType,sActive,szUpdatedBy,dtActiveY)
	select	2,a.AdvertiserID,'FRE','Y','DT_tblCC_'+cast(a.lCCListingID as varchar(20)),GETDATE()
	from	tblCC_ListingProcessV3 a
	where	a.LocalID is null
	and		a.Confirm='Y'
	and		a.action<>'DEL'

	/* BusListingStatus */
	update	s
	set		sLastStatus = 'N'
	--		select s.*
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.LocalID = b.ridax)
	join	tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action<>'DEL'
	and		s.sStatus<>'APV'

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'APV' as sStatus,'Y' as sActive, 'Y' as sLastStatus, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.LocalID = b.RIDAX)
	left join tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action<>'DEL'
	and		s.lAdvertiserID is null

	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  b.lAdvertiserid,'APV' as sStatus,'Y' as sActive, 'Y' as sLastStatus, 'DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtStatus
	from	tblCC_ListingProcessV3 a
	join	tblLP_BusListing b on (a.AdvertiserID = b.lAdvertiserID)
	left join tblLP_BusListingstatus s on (b.lAdvertiserID = s.lAdvertiserID and s.sLastStatus = 'Y')
	where	a.confirm='Y'
	and		a.action<>'DEL'
	and		a.LocalID is null
	and		s.lAdvertiserID is null

	/* Listing neither in LocalPromote nor NEW(Rid is null). Updates to Profile Database*/
	select  a.* into #UpdateProfileDatabase
	from	tblCC_ListingProcessV3 a
	left join tblLP_BusListing b on (a.LocalID=b.RIDAX)
	where	a.Confirm='Y'
	and		a.action<>'DEL'
	and		a.LocalID is not null
	and		b.RIDAX is null

	/* Geocode */
	if exists (select 1 from sys.objects where name='tblCC_geocode' and type='U')
	drop table tblCC_geocode

	create table tblCC_geocode
	(
		LocalID varchar(20),
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

	select	LocalID as RID,ListingStoreMaster.dbo.glb_fn_AddressLine1(Address) as Address,city,state,zipcode
	into	#tmpCC_geo
	from	#UpdateProfileDatabase 
	where	Address not like 'Serving %' and Address not like 'PO Box%'

	update	a
	set		a.Latitude=g.Latitude,a.Longitude=g.Longitude
	from	#UpdateProfileDatabase a 
	join	#tmpCC_geo c on (a.LocalID=c.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	delete	c 
	from	#tmpCC_geo c 
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	insert	tblCC_geocode
	exec	ListingStoreMaster.dbo.glb_procMQ_geocode 'localpromote..#tmpCC_geo'

	delete	c 
	from	#tmpCC_geo c 
	join	tblCC_geocode b on (c.RID=b.LocalID)

	update	a 
	set		a.latitude=b.gLatitude,
			a.longitude=b.gLongitude
	from	#UpdateProfileDatabase a
	join	tblCC_geocode b on a.LocalID=b.LocalID
	where	(b.gConfidence like '[BILPZ][1-3]_AA' or b.gConfidence like '[BLPI][1-3]AA_' or b.gConfidence like '[BLPI][1-3]A_A' or b.gConfidence like '[LP]1BBA')

	update	a 
	set		a.latitude=coalesce(a.latitude,z.latitude*pi()/180,0),
			a.longitude=coalesce(a.longitude,z.longitude*pi()/180,0)
	from	#UpdateProfileDatabase a
	join	tblCC_geocode b on a.LocalID=b.LocalID
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
	set		address=ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address),city=a.city,state=a.state,zipcode=a.zipcode,latitude=a.latitude,longitude=a.longitude,AgencyID=a.AgencyID,AdvertiserID=a.AdvertiserID
	from	#tmpCC_geo t 
	join	#UpdateProfileDatabase a on (a.LocalID=t.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.LocalID=b.RID

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode(RID,address,city,state,zipcode,latitude,longitude,AgencyID,AdvertiserID)
	select	a.LocalID,ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address) as Address,a.city,a.state,a.zipcode,a.latitude,a.longitude,a.AgencyID,a.AdvertiserID 
	from	#UpdateProfileDatabase a 
	join	#tmpCC_geo t on a.LocalID=t.RID
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.LocalID=b.RID
	where	b.RID is null

	drop table #tmpCC_geo
	
	/* Update Profile Database */
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
	begin
		update	a
		set		a.Name = b.Title,
				a.Address = b.Address,
				a.City = b.City,
				a.County=b.County,
				a.State = b.State,
				a.ZipCode = b.ZipCode,
				a.MainPhone = b.Phone,
				a.WebSite_URL = b.URL,
				a.Latitude = b.Latitude,
				a.Longitude = b.Longitude
		from	ListingStore..ListingV3 a
		join	#UpdateProfileDatabase b on (a.LocalID=b.LocalID)
	end
	else
	begin
		update	a
		set		a.Name = b.Title,
				a.Address = b.Address,
				a.City = b.City,
				a.County=b.County,
				a.State = b.State,
				a.ZipCode = b.ZipCode,
				a.MainPhone = b.Phone,
				a.WebSite_URL = b.URL,
				a.Latitude = b.Latitude,
				a.Longitude = b.Longitude
		from	ListingStore2..ListingV3 a
		join	#UpdateProfileDatabase b on (a.LocalID=b.LocalID)
	end

	/* acxBDC Get RID from acxListing */
	update	tblCC_acxBDC
	set		RID = a.LocalID
	-- select b.* 
	from	tblCC_ListingProcessV3 a
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
	select	b.advertiserID, a.BDC,'ADD','DT_tblCC_'+cast(a.lCCListingID as varchar(20)) as szUpdateBy, getdate() as dtUpdate 
	from	dbo.tblCC_acxBDC a
	join	dbo.tblCC_ListingProcessV3 b on (a.lCCListingID=b.lCCListingID)
	join	glb_tbl_BDC g on a.BDC=g.BDC
	join	dbo.tblLP_BusListing l on b.AdvertiserID = l.lAdvertiserID
	left join tblLP_BusListingCat c on (c.lAdvertiserID=b.AdvertiserID and c.BDC=a.BDC)
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

	create table #UpdateProfile
	(
		LocalID int
	)
	create table #UpdateProfileBDC
	(
		LocalID int,
		BDC int
	)
	create table #BDCs
	(
		LocalID int,
		BDC int,
		rownum int
	)

	insert  #UpdateProfile(LocalID)
	select	distinct b.LocalID
	from	#UpdateProfileDatabase b 
	join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID and c.sConfirm='Y')

	/* Update Profile Database */
	if exists (SELECT 1 FROM listingStoreMaster.dbo.acx_ActiveListingStore WHERE ActiveDB = 'ListingStore')
	begin

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,case when a.BDC1='' then null else a.BDC1 end
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC2
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC2,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC3
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC3,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC4
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC4,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC5
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC5,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC6
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC6,'') <> ''

		delete	a
		from	#UpdateProfileBDC a
		join	#UpdateProfileDatabase b on (a.LocalID=b.LocalID)
		join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID and c.sConfirm='Y')
		where	c.sdbState='OLD'
		and		a.BDC = c.BDC

		insert	#UpdateProfileBDC(LocalID,BDC)
		select	b.LocalID,c.BDC
		from 	#UpdateProfileDatabase b 
		join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID and c.sConfirm='Y')
		where	c.sdbState='NEW'

		;with	cte
		as		(
		select  LocalID,BDC,ROW_NUMBER() over (PARTITION by LocalID order by BDC desc) as rownum
		from	#UpdateProfileBDC
		)
		insert	#BDCs(LocalID,BDC,rownum)
		select  LocalID,BDC,rownum
		from	cte
		
		update	a
		set		a.BDC1 = b1.BDC,
				a.BDC2 = b2.BDC,
				a.BDC3 = b3.BDC,
				a.BDC4 = b4.BDC,
				a.BDC5 = b5.BDC,
				a.BDC6 = b6.BDC
		from	ListingStore..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		left	join	#BDCs b1 on (a.LocalID=b1.LocalID and b1.rownum=1)
		left    join	#BDCs b2 on (a.LocalID=b2.LocalID and b2.rownum=2)
		left    join	#BDCs b3 on (a.LocalID=b3.LocalID and b3.rownum=3)
		left    join	#BDCs b4 on (a.LocalID=b4.LocalID and b4.rownum=4)
		left    join	#BDCs b5 on (a.LocalID=b5.LocalID and b5.rownum=5)
		left    join	#BDCs b6 on (a.LocalID=b6.LocalID and b6.rownum=6)

	end
	else
	begin
		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,case when a.BDC1='' then null else a.BDC1 end
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC2
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC2,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC3
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC3,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC4
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC4,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC5
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC5,'') <> ''

		insert	#UpdateProfileBDC(LocalID,BDC)
		select  distinct a.LocalID,a.BDC6
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		where	isnull(a.BDC6,'') <> ''

		delete	a
		from	#UpdateProfileBDC a
		join	#UpdateProfileDatabase b on (a.LocalID=b.LocalID)
		join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID and c.sConfirm='Y')
		where	c.sdbState='OLD'
		and		a.BDC = c.BDC

		insert	#UpdateProfileBDC(LocalID,BDC)
		select	b.LocalID,c.BDC
		from 	#UpdateProfileDatabase b 
		join	tblCC_acxBDC c on (c.lCCListingID=b.lCCListingID and c.sConfirm='Y')
		where	c.sdbState='NEW'

		;with	cte
		as		(
		select  LocalID,BDC,ROW_NUMBER() over (PARTITION by LocalID order by BDC desc) as rownum
		from	#UpdateProfileBDC
		)
		insert	#BDCs(LocalID,BDC,rownum)
		select  LocalID,BDC,rownum
		from	cte
		
		update	a
		set		a.BDC1 = b1.BDC,
				a.BDC2 = b2.BDC,
				a.BDC3 = b3.BDC,
				a.BDC4 = b4.BDC,
				a.BDC5 = b5.BDC,
				a.BDC6 = b6.BDC
		from	ListingStore2..ListingV3 a
		join	#UpdateProfile b on (a.LocalID=b.LocalID)
		left	join	#BDCs b1 on (a.LocalID=b1.LocalID and b1.rownum=1)
		left    join	#BDCs b2 on (a.LocalID=b2.LocalID and b2.rownum=2)
		left    join	#BDCs b3 on (a.LocalID=b3.LocalID and b3.rownum=3)
		left    join	#BDCs b4 on (a.LocalID=b4.LocalID and b4.rownum=4)
		left    join	#BDCs b5 on (a.LocalID=b5.LocalID and b5.rownum=5)
		left    join	#BDCs b6 on (a.LocalID=b6.LocalID and b6.rownum=6)

	end

	/* update Turn Flag */
	Update	a 
	set		a.sConfirm = case when b.Confirm='Y' then 'T' else b.Confirm end,
			a.RID = b.LocalID,
			a.lAdvertiserID = b.AdvertiserID,
			a.sAgencyID = b.AgencyID, 
			a.dtTurn = getdate()
	from	tblCC_acxListing a
	join	tblCC_ListingProcessV3 b on (a.lCCListingID=b.lCCListingID)
	where	a.sConfirm='Y'

	update	a
	set		a.sConfirm = case when b.Confirm='Y' then 'T' else b.Confirm end, 
			a.RID = b.LocalID,
			a.dtTurn = getdate()
	from	tblCC_acxBDC a
	join	tblCC_ListingProcessV3 b on (a.RID = b.LocalID)
	where	a.sConfirm ='Y'

	drop table #UpdateProfileDatabase
	drop table #BDCs
	drop table #UpdateProfile
	drop table #UpdateProfileBDC

	EXEC msdb.dbo.sp_send_dbMail
		@profile_name = 'ReportingSvc', 
		@recipients ='sqlsupport@local.com',
		@subject='usp_DT_tblCC_acxListing of LA3SQL01\TonyStark finished successfully'

END



GO
