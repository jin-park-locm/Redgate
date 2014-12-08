SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_DT_LocalPromote_Process]
AS
BEGIN
	SET NOCOUNT ON;

	-- BusListing is in production but the latest BusListingstatus shows approved. This should not happen from UI but data shown it is happening.
	update	a
	set		a.sAction='UPD',a.dtAction=GETDATE(),a.szUpdatedBy='DT_LP_Process: patch BusListingStatus'
	--select *
	from tblLP_BusListing a (nolock)
	join tblLP_BusListingStatus b on (a.ladvertiserid = b.ladvertiserid and b.sLastStatus='Y')
	where	sStatus in ('APV')
	and		a.sAction in ('TRN')

	if exists (select 1 from sys.objects where name='tblLP_ListingProcess' and type='U')
	drop table tblLP_ListingProcess
	
	create table tblLP_ListingProcess(
		[lAdvertiserID] [varchar](64) NULL,
		[ListingID] [uniqueidentifier] NULL,
		[RID] [int] NULL,
		[lMemberID] [int] NOT NULL,
		[AgencyId] [char](2) NULL,
		[Title] [varchar](250) NULL,
		[BldgName] [varchar](50) NULL,
		[Address] [varchar](100) NULL,
		[Unit] [varchar](10) NULL,
		[City] [varchar](50) NULL,
		[State] [char](2) NULL,
		[zipcode] [varchar](10) NULL,
		[Zip4] [varchar](4) NULL,
		[lCountryID] [int] NOT NULL,
		[LocationName] [varchar](50) NULL,
		[PhoneNumber] [varchar](20) NULL,
		[Fax] [varchar](20) NULL,
		[PhoneNumberAlt] [varchar](20) NULL,
		[URL] [varchar](300) NULL,
		[Email] [varchar](250) NULL,
		[HideAddress] [char](1) NULL,
		[sAction] [char](3) NULL,
		[dtAction] [datetime] NOT NULL,
		[dtListing1st] [datetime] NOT NULL,
		[UpdatedBy] [char](3) NULL,
		[Tier] [int] NOT NULL,
		[Bid] [int] NOT NULL,
		[Latitude] [decimal](12, 9) NULL,
		[Longitude] [decimal](12, 9) NULL,
		[DtADD] [datetime] NOT NULL,
		[AdultFlag] [char](1) NULL,
		[TitleSearch] [varchar](255) NULL,
		[AddressSearch] [varchar] (255) NULL,
		[Reason] [varchar](30) NULL,
		[Termcode] [varchar](30) NULL
	)

	INSERT	tblLP_ListingProcess
	( 		
		lAdvertiserID,
		RID,
		ListingID,
		lMemberID,
		AgencyID, 
		Title, 
		BldgName,
		ADDress, 
		Unit,
		City, 
		State, 
		ZipCode, 
		Zip4,
		lCountryID,
		LocationName,
		Phonenumber, 
		Fax,
		PhonenumberAlt,
		URL, 
		Email,
		HideAddress,
		Latitude,
		Longitude,
		sAction,
		dtAction,
		dtListing1st,
		UpdatedBy,
		Tier, 
		Bid,
		DtAdd
	)
	SELECT 
		Convert(varchar(64),a.lAdvertiserID) AS lAdvertiserID,
		a.RIDAX,
		ListingID as ListingID,
		lMemberID as lMemberID,
		'AF' AS AgencyId,
		Convert(varchar(250),sztitle) AS Title,
		Convert(varchar(50),szBldgName) AS BldgName,
		Convert(Varchar(100), szStreetName) as Address,
		Convert(Varchar(10), szUnit) as Unit,
		Convert(Varchar(50),szCity) as City, 
		Convert(char(2),sState) as State, 
		Convert(varchar(10),sPostalCode) as zipcode,
		Convert(varchar(4),sZip4) as Zip4,
		lCountryID as lCountryID,
		Convert(varchar(50),szLocationName) as LocationName,
		Convert(Varchar(20),szPhone) as PhoneNumber,
		Convert(Varchar(20),szFax) as Fax,
		Convert(Varchar(20),szPhoneAlt) as PhoneNumberAlt,
		Convert(Varchar(300),szURL) as URL,
		Convert(Varchar(250),szEmail) as Email,
		Convert(char(1),sHideAddress) as HideAddress,
		c.Latitude,
		c.Longitude,
		Convert(char(3),sAction) as sAction,
		dtAction as dtAction,
		dtListing1st as dtListing1st,
		Convert(char(3),a.szUpdatedBy) as UpdatedBy,
		0 AS Tier,
		0 AS Bid ,
		CONVERT(datetime,getdate()) AS DtADD
	FROM 	tblLP_BusListing a
	join	tblLP_BusListingStatus b on (a.ladvertiserid = b.ladvertiserid and b.sLastStatus='Y')
	left join tblLP_BusListingLatLong c on (a.lAdvertiserID=c.lAdvertiserID)
	where	sStatus in ('APV','TRN')
	and		a.sAction in ('ADD','UPD')

	update	a
	set		a.agencyid = 'AP'
	from	tblLP_ListingProcess a
	join	tblLP_ProductOrder b on (a.ladvertiserid = b.ladvertiserid and b.sActive='Y')

	/********************
	 Normalization 
	*********************/
	update	a
	set		ZipCode = ListingStoreMaster.dbo.glb_fn_normalizeZipCode(ZipCode),
			PhoneNumber = ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(PhoneNumber),
			PhoneNumberAlt = ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(PhoneNumberAlt),
			Address = ListingStoreMaster.dbo.glb_fn_normalizeAddress(ListingStoreMaster.dbo.glb_fn_stripSpecialChars(Address)),
			Title = ListingStoreMaster.dbo.glb_fn_CapitalizeTitle(ListingStoreMaster.dbo.glb_fn_stripSpecialChars(Title))
	from	tblLP_ListingProcess a

	update	a
	set		Address='Serving Your Area'
	from	tblLP_ListingProcess a
	where	isnull(Address,'')='' or Address like 'Serving %'	
	
	update	a
	set		State = ListingStoreMaster.dbo.glb_fn_normalizeState(State,ZipCode),
			City = ListingStoreMaster.dbo.glb_fn_NormalizeCity(City,ZipCode),
			TitleSearch = ListingStoreMaster.dbo.glb_fn_titleSearch(Title),
			AddressSearch = ListingStoreMaster.dbo.glb_fn_addressSearch(Address)
	from	tblLP_ListingProcess a
	where	zipcode is not null

	update	a
	set		Reason = 'Bad Data',Termcode='BadListing'	--BAD data
	from	tblLP_ListingProcess a
	where	(ZipCode is null or State is null or PhoneNumber is null or LEN(Title) < 2 or Title is null)

	/*******************************************
	 Mark Duplicate if Listing exists in LP 
	********************************************/
	update	a
	set		a.Reason='DUP',a.Termcode='DUP'
	from	tblLP_ListingProcess a,
			tblLP_BusListing b (nolock)
	Where	a.PhoneNumber=b.szPhone	
	and		a.city=b.szCity
	and		a.state=b.sState
	and		a.ZipCode=b.sPostalCode
	and		a.lAdvertiserID<>b.lAdvertiserID
	and		a.Termcode is null
	and		a.RID is null
	and		b.sAction in ('TRN')
	and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.szTitleSearch,1) > 70
				and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(a.AddressSearch,ListingStoreMaster.dbo.glb_fn_addressSearch(b.szStreetName)) > 65)
			or(AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(b.szStreetName)
				and		substring(a.Title,1,12)=substring(b.szTitle,1,12))
			)

	/*****************************************************
	 Find Duplicate with in tblLP_ListingProcess 
	******************************************************/
	update	tblLP_ListingProcess
	set		Listingid = NEWID()
	where	Reason is null
		
	select	distinct a.ListingID as ListID,len(a.title) as titleLen,len(a.address) as adrsLen, b.ListingID as ListID2,a.sAction 
	into	#dupes_tmp1
	from	tblLP_ListingProcess a (nolock),
			tblLP_ListingProcess b
	Where	a.PhoneNumber=b.PhoneNumber
	and		a.city=b.city
	and		a.state=b.state
	and		a.ZipCode=b.ZipCode
	and		a.Listingid<>b.Listingid
	and		a.Reason is null and b.Reason is null
	and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.TitleSearch,1) > 70
				and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(a.AddressSearch,b.AddressSearch) > 65)
			or(a.AddressSearch=b.AddressSearch and substring(a.Title,1,12)=substring(b.Title,1,12))
			)

	create table #dupes_tmp2(ListID uniqueidentifier,lid uniqueidentifier)
	create clustered index idx_temp1_ListID on #dupes_tmp1(ListID)
	create index idx_temp2_ListID on #dupes_tmp2(ListID)
	
	declare		src_acx_cr cursor for
	select		ListID from #dupes_tmp1
	group by	ListID,adrsLen,titleLen,sAction
	order by	sAction desc,count(*) desc,adrsLen desc,titleLen asc 

	declare		@ListID uniqueidentifier
	open		src_acx_cr
	fetch next from src_acx_cr into @ListID

	while @@fetch_status=0
	begin
		if not exists (select 1 from #dupes_tmp2 where ListID=@ListID)
			and not exists (select 1 from #dupes_tmp2 where ListID in (select ListID2 from #dupes_tmp1 where ListID=@ListID))
		insert	#dupes_tmp2(ListID,lid)
		select	@ListID,@ListID
		union
		select	ListID2,@ListID from #dupes_tmp1 where ListID=@ListID
		
		else if not exists (select 1 from #dupes_tmp2 where ListID=@ListID)
			--and exists (select 1 from #dupes_tmp2 where ListID in (select ListID2 from #dupes_tmp1 where ListID=@ListID))
		insert	#dupes_tmp2(ListID,lid)
		select	@ListID,b.lid from #dupes_tmp1 a 
		join	#dupes_tmp2 b on (a.ListID2=b.ListID)
		where	a.ListID=@ListID	

		fetch next from src_acx_cr into @ListID	
	end
	close src_acx_cr
	deallocate src_acx_cr

	update	a 
	set		a.Reason='DUP', a.Termcode='DUP'	
	from	tblLP_ListingProcess a 
	join	#dupes_tmp2 b on (a.Listingid=b.ListID)
	where	b.ListID <> b.lid	

	drop table #dupes_tmp1
	drop table #dupes_tmp2

	update	a
	set		Listingid = null
	from	tblLP_ListingProcess a
	where	ListingID is not null
	
	/*******************************************
	 Get RID from match in profile 
	********************************************/
	if exists (select 1 from ListingStoreMaster..acx_ActiveListingStore where ActiveDB='ListingStore')
	begin	
		update	a
		set		Rid=b.Rid,
				ListingID=b.ListingID
		--		select *
		from	listingStore..acx_tbl_Listing b (nolock), tblLP_ListingProcess a
		Where	a.Rid is null 
		and		a.Termcode is null
		and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.TitleSearch,1) > 70
					and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(AddressSearch,ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)) > 65)
				or (AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)
					and		SUBSTRING(a.Title,1,12)=SUBSTRING(b.Title,1,12))
				)	
		and		a.city=b.city
		and		a.state=b.state
		and		a.ZipCode=b.ZipCode
		and		a.PhoneNumber=b.phonenumber	
		
		update	a
		set		ListingID=b.ListingID
		--		select *
		from	listingStore..acx_tbl_Listing b (nolock), tblLP_ListingProcess a
		Where	a.RID=b.RID
		and		a.ListingID is null
		and		a.Termcode is null
		
	end
	else
	begin
		update	a
		set		Rid=b.Rid,
				ListingID=b.ListingID
		--		select *
		from	listingStore2..acx_tbl_Listing b (nolock), tblLP_ListingProcess a
		Where	a.Rid is null 
		and		a.Termcode is null
		and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.TitleSearch,1) > 70
					and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(AddressSearch,ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)) > 65)
				or (AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)
					and		SUBSTRING(a.Title,1,12)=SUBSTRING(b.Title,1,12))
				)	
		and		a.city=b.city
		and		a.state=b.state
		and		a.ZipCode=b.ZipCode
		and		a.PhoneNumber=b.phonenumber	

		update	a
		set		ListingID=b.ListingID
		--		select *
		from	listingStore2..acx_tbl_Listing b (nolock), tblLP_ListingProcess a
		Where	a.RID=b.RID
		and		a.ListingID is null
		and		a.Termcode is null

	end
	
	/***********************************
	 Generate New RIDs 
	************************************/
	create table #genNewRID(
		RID int not null IDENTITY(36510598,1),
		AdvertiserID varchar(20) not null
	)

	declare @LatestRID int
	select	@LatestRID=NextKey from [LA3SQL02\BruceWayne].trackload.dbo.tblAL_RIDGenerator

	SET IDENTITY_INSERT #genNewRID ON
	Insert	#genNewRID(RID, Advertiserid)
	select	@LatestRID+1,1
	SET IDENTITY_INSERT #genNewRID OFF

	delete	from #genNewRID

	INSERT	#genNewRID (Advertiserid)
	SELECT 	lAdvertiserID 
	FROM 	tblLP_ListingProcess
	Where	RID is null
	and		Termcode is null

	UPDATE 	tblLP_ListingProcess
	SET 	RID=b.RID
	FROM 	tblLP_ListingProcess a , #genNewRID b
	WHERE 	b.Advertiserid=a.lAdvertiserID

	If (select max(RID) from tblLP_ListingProcess where len(rid) < 10) > @LatestRID
	Begin
		Update	[LA3SQL02\BruceWayne].trackload.dbo.tblAL_RIDGenerator
		SET		Nextkey=(select max(RID) from tblLP_ListingProcess where len(rid) < 10)
	End

	drop table #genNewRID

	/************************************
	 Generate New ListingIDs
	*************************************/
	truncate table tblAL_GetNewListingID
	
	insert  tblAL_GetNewListingID(TableKey)
	select	RID from tblLP_ListingProcess 
	where	ListingID is null
	and		Termcode is null

	declare	@result int
	exec	@result=[LA3SQL02\BruceWayne].TrackLoad.dbo.usp_DT_ListingID_gen
	if (@result <> 0)
		raiserror('RPC usp_DT_ListingID_gen failed',16,1)
	
	update	a
	set		a.ListingID=b.ListingKey	
	from	tblLP_ListingProcess a	
	join	tblAL_GetNewListingID b on (a.RID=b.TableKey)

	/*----------------------------------
	--UPDATE AdultFlag
	------------------------------------*/
	update	b
	set		AdultFlag = 'Y'
	--		select b.RID,c.*
	from	tblLP_ListingProcess b
	join	dbo.tblLP_BusListingCat c on (b.lAdvertiserID=c.lAdvertiserID and c.sAction='ADD')
	join	ListingStoreMaster..glb_tbl_AdultBDC d on c.BDC=d.BDC

	/**********************
	 GeoCoding
	***********************/
	if exists (select 1 from sys.objects where name='tblLP_geocode' and type='U')
	drop table tblLP_geocode

	create table tblLP_geocode
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
	from	tblLP_ListingProcess a
	left join zipcodes z on (a.zipcode=z.zipcode and z.CityType='D')
	where	a.TermCode is null
	and		(Address like 'Serving %' or Address like 'PO Box%')

	select	Rid,ListingStoreMaster.dbo.glb_fn_AddressLine1(Address) as Address,city,state,zipcode
	into	#tmpLP_geo
	from	tblLP_ListingProcess 
	where	TermCode is null
	and		Address not like 'Serving %' and Address not like 'PO Box%'

	update	a
	set		a.Latitude=g.Latitude,a.Longitude=g.Longitude
	from	tblLP_ListingProcess a 
	join	#tmpLP_geo c on (a.RID=c.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	delete	c 
	from	#tmpLP_geo c 
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	insert	tblLP_geocode
	exec	ListingStoreMaster.dbo.glb_procMQ_geocode 'localpromote..#tmpLP_geo'

	delete	c 
	from	#tmpLP_geo c 
	join	tblLP_geocode b on (c.RID=b.RID)

	update	a 
	set		a.latitude=b.gLatitude,
			a.longitude=b.gLongitude
	from	tblLP_ListingProcess a
	join	tblLP_geocode b on a.RID=b.RID
	where	(b.gConfidence like '[BILPZ][1-3]_AA' or b.gConfidence like '[BLPI][1-3]AA_' or b.gConfidence like '[BLPI][1-3]A_A' or b.gConfidence like '[LP]1BBA')

	update	a 
	set		a.latitude=coalesce(a.latitude,z.latitude*pi()/180,0),
			a.longitude=coalesce(a.longitude,z.longitude*pi()/180,0)
	from	tblLP_ListingProcess a
	join	tblLP_geocode b on a.RID=b.RID
	left join zipcodes z on (a.ZipCode=z.ZIPCode and z.CityType='D')
	where	b.gConfidence not like '[BILPZ][1-3]_AA'
	and		b.gConfidence not like '[BLPI][1-3]AA_'
	and		b.gConfidence not like '[BLPI][1-3]A_A'
	and		b.gConfidence not like '[BLPI][1-3]_AA'
	and		b.gConfidence not like '[LP]1BBA'

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode(Address,City,State,Zipcode,Latitude,Longitude,Confidence,Entity,dtUpdate)
	select	distinct a.Address,a.City,a.State,a.Zipcode,convert(decimal(12,9),a.gLatitude),convert(decimal(12,9),a.gLongitude),a.gConfidence,a.gEntity,getdate() 
	from	tblLP_geocode a
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode b on (a.zipcode=b.zipcode and a.Address=b.Address and a.City=b.City and a.State=b.State)
	where	b.Address is null
	and		(a.gConfidence like '[BILPZ][1-3]_AA' or a.gConfidence like '[BLPI][1-3]AA_' or a.gConfidence like '[BLPI][1-3]A_A' or a.gConfidence like '[LP]1BBA')

	update	b
	set		address=ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address),city=a.city,state=a.state,zipcode=a.zipcode,latitude=a.latitude,longitude=a.longitude,AgencyID=a.AgencyID,AdvertiserID=a.lAdvertiserID
	from	#tmpLP_geo t 
	join	tblLP_ListingProcess a on (a.RID=t.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.RID=b.RID

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode(RID,address,city,state,zipcode,latitude,longitude,AgencyID,AdvertiserID)
	select	a.Rid,ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address) as Address,a.city,a.state,a.zipcode,a.latitude,a.longitude,a.AgencyID,a.lAdvertiserID 
	from	tblLP_ListingProcess a 
	join	#tmpLP_geo t on a.RID=t.RID
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.RID=b.RID
	where	b.RID is null

	drop table #tmpLP_geo

	/**************************
	 LocalPromote
	***************************/

	/* BusListing */
	update	a
	set		a.sAgencyID = b.AgencyId,
			a.RIDAX = b.RID,
			a.ListingID = b.ListingID,
			a.szTitle = b.Title,
			a.szTitleSearch = b.TitleSearch,
			a.szTitleStrip = dbo.ufn_StrippingTitle(b.Title),
			a.szStreetName = b.Address,
			a.szCity = b.City,
			a.sState = isnull(b.State,a.sState),
			a.sPostalCode = isnull(b.ZipCode,a.sPostalCode),
			a.szPhone = isnull(b.PhoneNumber,a.szPhone),
			a.szURL = b.URL,
			a.sHideAddress = b.HideAddress,
			a.dtAction = GETDATE(),
			a.saction = case when Termcode is null then 'TRN'
							 when Termcode='DUP' then 'DUP'
							 else 'BAD'
						end
	from	tblLP_BusListing a
	join	tblLP_ListingProcess b on (a.lAdvertiserID=b.lAdvertiserID)
	
	/* BusListingStatus */
	update	a
	set		a.sLastStatus='N'
	from	tblLP_BusListingStatus a
	join	tblLP_ListingProcess b on (a.lAdvertiserID=b.lAdvertiserID)
	where	a.sLastStatus='Y'
	
	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  lAdvertiserid, 
			case when Termcode is null then 'TRN'
				 when Termcode='DUP' then 'DND'
				 else 'ICP'
			end as sStatus,
			'Y' as sLastStatus,
			'Y' as sActive,
			'DT_LP_Process' as szUpdateBy,
			getdate() as dtStatus
	from	dbo.tblLP_ListingProcess

	/* BusListingLatLong */
	update	a
	set		a.Latitude=b.Latitude,
			a.Longitude=b.Longitude
	from	tblLP_BusListingLatLong a
	join	tblLP_ListingProcess b on (a.lAdvertiserID=b.lAdvertiserID)
	where	b.Termcode is null

	insert	tblLP_BusListingLatLong (lAdvertiserID,RIDAX,Latitude,Longitude,Geo,dtAdd)
	select	a.lAdvertiserID,a.RID,a.Latitude,a.Longitude,'Y',GETDATE()
	from	tblLP_ListingProcess a
	left join tblLP_BusListingLatLong b on (a.lAdvertiserID=b.lAdvertiserID)
	where	b.lAdvertiserID is null
	and		a.Termcode is null
	and		a.Latitude is not null
	
	/**************************
	 Profile Database
	***************************/
		
	if exists (select 1 from ListingStoreMaster..acx_ActiveListingStore where ActiveDB='ListingStore')	
	begin

		--listing
		update	a
		set		a.Agencyid=b.AgencyId,
				a.AdvertiserID=b.lAdvertiserID,	
				a.Title=b.Title,
				a.TitleSearch=b.TitleSearch,
				a.Address= case when b.HideAddress='Y' then 'Serving Your Area' else b.Address end,
				a.City=b.City,
				a.State=b.State,
				a.ZipCode=b.zipcode,
				a.PhoneNumber=b.PhoneNumber,
				a.AltPhone = b.PhoneNumberAlt,
				a.URL=b.URL,
				a.Allflag = case when b.HideAddress='Y' then 'HA' else null end,
				a.AdultFlag = b.AdultFlag,
				a.Latitude = b.Latitude,
				a.Longitude = b.Longitude
		from	ListingStore..acx_tbl_listing a
		join	tblLP_ListingProcess b on (a.RID=b.RID)
		where	b.Termcode is null
		
		insert	ListingStore..acx_tbl_listing(ListingID,RID,AdvertiserID,Agencyid,Title,Address,City,State,ZipCode,PhoneNumber,AltPhone,URL,dtAdd,TitleSearch,Allflag,AdultFlag,Latitude,Longitude)
		select	a.ListingID,a.RID,a.lAdvertiserID,a.AgencyId,a.Title,case when a.HideAddress='Y' then 'Serving Your Area' else a.Address end as Address,
				a.City,a.State,a.zipcode,a.PhoneNumber,a.PhoneNumberAlt,a.URL,GETDATE(),a.TitleSearch,case when a.HideAddress='Y' then 'HA' else null end,a.AdultFlag,a.Latitude,a.Longitude
		from	tblLP_ListingProcess a
		left join ListingStore..acx_tbl_listing b on (a.RID=b.RID)
		where	a.Termcode is null
		and		b.RID is null

		--BDC
		delete  a
		from	ListingStore..acx_map_ListingBDC a
		join	tblLP_ListingProcess b on (a.RID=b.RID)
		left join	tblLP_BusListingCat c on (b.lAdvertiserID=c.lAdvertiserID and a.BDC=c.BDC and c.sAction='ADD')
		where	b.Termcode is null
		and		c.lAdvertiserID is null
		and		a.AgencyID in ('AP','AF')

		insert	ListingStore..acx_map_ListingBDC(ListingID,RID,BDC,BDCOrig,col,dtAdd,PartnerRID,AgencyID,Latitude,Longitude)
		select	b.ListingID,b.RID,c.BDC,c.BDC,1,GETDATE(),b.lAdvertiserID,b.AgencyId,b.Latitude,b.Longitude
		from	tblLP_ListingProcess b
		join	tblLP_BusListingCat c on b.lAdvertiserID=c.lAdvertiserID
		left join ListingStore..acx_map_ListingBDC a on (a.RID=b.RID and c.BDC=a.BDC)
		where	b.Termcode is null
		and		a.RID is null
		and		c.sAction='ADD'

		--URL
		delete	a 
		from	ListingStore..acx_map_listingURL a
		join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='Acxiom')
		where	Termcode is null
		and		ISNULL(b.URL,'')<>''
		and		a.AgencyId = 'AF'
		and		b.AgencyId = 'AP'

		delete	a 
		from	ListingStore..acx_map_listingURL a
		join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='Acxiom')
		where	Termcode is null
		and		ISNULL(b.URL,'')<>''
		and		a.AgencyId = 'AP'
		and		b.AgencyId = 'AF'
		
		update	a
		set		a.Url=b.URL,
				a.AgencyId=b.AgencyId,
				a.PartnerRID=b.lAdvertiserID
		from	ListingStore..acx_map_listingURL a
		join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='Acxiom')
		where	b.Termcode is null
		and		ISNULL(b.URL,'')<>''
		and		a.AgencyId in ('AP','AF')
		
		insert	ListingStore..acx_map_listingURL(ListingId,RID,Identifier,Url,DtAdd,PartnerRID,AgencyId,PriorityID,PositionCode,URLType)
		select  b.ListingID,b.RID,'Acxiom',b.URL,GETDATE(),b.lAdvertiserID,b.AgencyId,0,'TP','WU'
		from	tblLP_ListingProcess b
		left join ListingStore..acx_map_listingURL a on (a.RID=b.RID and a.AgencyID in ('AP','AF') and a.Identifier='Acxiom')
		where	b.Termcode is null
		and		a.RID is null
		and		ISNULL(b.URL,'')<>''
	
		----specialOfferURL
		--update	a
		--set		a.Url=c.szURL,
		--		a.DisplayUrl=c.szDisplayURL,
		--		a.AgencyId=b.AgencyId,
		--		a.PartnerRID=b.lAdvertiserID
		--from	ListingStore..acx_map_listingURL a
		--join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='LPSpecial1')
		--join	tblLP_BusSpecialOfferURL c on (b.lAdvertiserID=c.lAdvertiserID)
		--where	b.Termcode is null
		--and		ISNULL(c.szURL,'')<>''
		--and		a.AgencyId in ('AP','AF')
		--and		b.AgencyId in ('AP')
		
		--insert	ListingStore..acx_map_listingURL(RID,Identifier,Url,DisplayUrl,DtAdd,PartnerRID,AgencyId,PriorityID,PositionCode,URLType)
		--select  b.RID,'LPSpecial1',c.szURL,c.szDisplayURL,GETDATE(),b.lAdvertiserID,b.AgencyId,0,'TP','WU'
		--from	tblLP_ListingProcess b
		--join	tblLP_BusSpecialOfferURL c on (b.lAdvertiserID=c.lAdvertiserID)
		--left join ListingStore..acx_map_listingURL a on (a.RID=b.RID and a.AgencyID in ('AP','AF') and a.Identifier='LPSpecial1')
		--where	b.Termcode is null
		--and		ISNULL(c.szURL,'')<>''
		--and		b.AgencyId in ('AP')
		
		--Content
		select	b.Rid,b.ListingID,'Acxiom' as Identifier, NULL as ContentType, NULL as contentURL, Null as contentDisplayURL, Null as ContentTile,
			'<table cellpadding=5 cellspacing=5><tr><td>' +
				CASE
    				WHEN (isnull(b.email,'')='') THEN '' 
    				ELSE '<b>Business Email:</b><BR><a href="mailto:' + b.email + '">' + b.email + '</a><BR><BR>'  
				END 
			+ '<b>Additional Information:</b><BR>' + a.szBusDesc + '</td></tr></table>' as Content,
			b.lAdvertiserID as PartnerRid,
			b.Agencyid
		into	#tmp_LPcontent	
		from	tblLP_ListingProcess b
		join	tblLP_BusDescription a on (b.lAdvertiserID=a.lAdvertiserID)
		where	b.Termcode is null
		and		ISNULL(a.szBusDesc,'')<>''

		delete	a 
		from	ListingStore..acx_tbl_Content a
		join	#tmp_LPcontent b on (a.RID=b.RID)
		where	a.AgencyId = 'AP'
		and		b.AgencyId = 'AF'

		delete	a 
		from	ListingStore..acx_tbl_Content a
		join	#tmp_LPcontent b on (a.RID=b.RID)
		where	a.AgencyId = 'AF'
		and		b.AgencyId = 'AP'
				
		update	a
		set		a.content=b.Content,
				a.AgencyID=b.AgencyId
		from	ListingStore..acx_tbl_Content a
		join	#tmp_LPcontent b on (a.RID=b.RID)
		where	a.AgencyID in ('AP','AF')
		and		a.content<>b.Content
		
		insert	ListingStore..acx_tbl_Content(Listingid,RID,Identifier,ContentType,ContentURL,contentDisplayURL,contentTitle,content,PartnerRID,AgencyID)
		select	a.ListingID,a.RID,a.Identifier,a.ContentType,a.contentURL,a.contentDisplayURL,a.ContentTile,a.Content,a.PartnerRid,a.AgencyId
		from	#tmp_LPcontent a
		left join ListingStore..acx_tbl_Content b on (a.RID=b.RID and b.AgencyID in ('AP','AF'))
		where	b.RID is null

		drop table #tmp_LPcontent
			
		--Result Desc
		select	b.RID,b.ListingID, Convert(Varchar(4000),LTrim(Replace( a.szBusDesc,'"',''))) as ResultDesc, b.lAdvertiserID as PartnerRid, b.AgencyID, getdate() as dtAdd 
		into	#tmp_LPResultDesc
		from	tblLP_ListingProcess b
		join	tblLP_BusDescription a on (b.lAdvertiserID=a.lAdvertiserID)
		where	b.Termcode is null
		and		ISNULL(a.szBusDesc,'')<>''

		delete	a 
		from	ListingStore..acx_tbl_ResultDesc a
		join	#tmp_LPResultDesc b on (a.RID=b.RID)
		where	a.AgencyId = 'AP'
		and		b.AgencyId = 'AF'

		delete	a 
		from	ListingStore..acx_tbl_ResultDesc a
		join	#tmp_LPResultDesc b on (a.RID=b.RID)
		where	a.AgencyId = 'AF'
		and		b.AgencyId = 'AP'

		update	a
		set		a.ResultDesc=b.ResultDesc,
				a.AgencyID=b.AgencyId
		from	ListingStore..acx_tbl_ResultDesc a
		join	#tmp_LPResultDesc b on (a.RID=b.RID)
		where	a.AgencyID in ('AP','AF')
		and		a.ResultDesc<>b.ResultDesc
		
		insert	ListingStore..acx_tbl_ResultDesc(Listingid,RID,ResultDesc,Advertiserid,AgencyID,dtAdd)
		select	a.ListingID,a.RID,a.ResultDesc,a.PartnerRid,a.AgencyId,a.dtAdd
		from	#tmp_LPResultDesc a
		left join ListingStore..acx_tbl_ResultDesc b on (a.RID=b.RID and b.AgencyID in ('AP','AF'))
		where	b.RID is null

		drop table #tmp_LPResultDesc
	
	end
	else
	begin

		--listing
		update	a
		set		a.Agencyid=b.AgencyId,
				a.AdvertiserID=b.lAdvertiserID,	
				a.Title=b.Title,
				a.TitleSearch=b.TitleSearch,
				a.Address= case when b.HideAddress='Y' then 'Serving Your Area' else b.Address end,
				a.City=b.City,
				a.State=b.State,
				a.ZipCode=b.zipcode,
				a.PhoneNumber=b.PhoneNumber,
				a.AltPhone = b.PhoneNumberAlt,
				a.URL=b.URL,
				a.Allflag = case when b.HideAddress='Y' then 'HA' else null end,
				a.AdultFlag = b.AdultFlag,
				a.Latitude = b.Latitude,
				a.Longitude = b.Longitude
		from	ListingStore2..acx_tbl_listing a
		join	tblLP_ListingProcess b on (a.RID=b.RID)
		where	b.Termcode is null
		
		insert	ListingStore2..acx_tbl_listing(ListingID,RID,AdvertiserID,Agencyid,Title,Address,City,State,ZipCode,PhoneNumber,AltPhone,URL,dtAdd,TitleSearch,Allflag,AdultFlag,Latitude,Longitude)
		select	a.ListingID,a.RID,a.lAdvertiserID,a.AgencyId,a.Title,case when a.HideAddress='Y' then 'Serving Your Area' else a.Address end as Address,
				a.City,a.State,a.zipcode,a.PhoneNumber,a.PhoneNumberAlt,a.URL,GETDATE(),a.TitleSearch,case when a.HideAddress='Y' then 'HA' else null end,a.AdultFlag,a.Latitude,a.Longitude
		from	tblLP_ListingProcess a
		left join ListingStore2..acx_tbl_listing b on (a.RID=b.RID)
		where	a.Termcode is null
		and		b.RID is null

		--BDC
		delete  a
		from	ListingStore2..acx_map_ListingBDC a
		join	tblLP_ListingProcess b on (a.RID=b.RID)
		left join	tblLP_BusListingCat c on (b.lAdvertiserID=c.lAdvertiserID and a.BDC=c.BDC and c.sAction='ADD')
		where	b.Termcode is null
		and		c.lAdvertiserID is null
		and		a.AgencyID in ('AP','AF')

		insert	ListingStore2..acx_map_ListingBDC(ListingID,RID,BDC,BDCOrig,col,dtAdd,PartnerRID,AgencyID,Latitude,Longitude)
		select	b.ListingID,b.RID,c.BDC,c.BDC,1,GETDATE(),b.lAdvertiserID,b.AgencyId,b.Latitude,b.Longitude
		from	tblLP_ListingProcess b
		join	tblLP_BusListingCat c on b.lAdvertiserID=c.lAdvertiserID
		left join ListingStore2..acx_map_ListingBDC a on (a.RID=b.RID and c.BDC=a.BDC)
		where	b.Termcode is null
		and		a.RID is null
		and		c.sAction='ADD'

		--URL
		delete	a 
		from	ListingStore2..acx_map_listingURL a
		join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='Acxiom')
		where	Termcode is null
		and		ISNULL(b.URL,'')<>''
		and		a.AgencyId = 'AF'
		and		b.AgencyId = 'AP'

		delete	a 
		from	ListingStore2..acx_map_listingURL a
		join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='Acxiom')
		where	Termcode is null
		and		ISNULL(b.URL,'')<>''
		and		a.AgencyId = 'AP'
		and		b.AgencyId = 'AF'
		
		update	a
		set		a.Url=b.URL,
				a.AgencyId=b.AgencyId,
				a.PartnerRID=b.lAdvertiserID
		from	ListingStore2..acx_map_listingURL a
		join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='Acxiom')
		where	b.Termcode is null
		and		ISNULL(b.URL,'')<>''
		and		a.AgencyId in ('AP','AF')
		
		insert	ListingStore2..acx_map_listingURL(ListingId,RID,Identifier,Url,DtAdd,PartnerRID,AgencyId,PriorityID,PositionCode,URLType)
		select  b.ListingID,b.RID,'Acxiom',b.URL,GETDATE(),b.lAdvertiserID,b.AgencyId,0,'TP','WU'
		from	tblLP_ListingProcess b
		left join ListingStore2..acx_map_listingURL a on (a.RID=b.RID and a.AgencyID in ('AP','AF') and a.Identifier='Acxiom')
		where	b.Termcode is null
		and		a.RID is null
		and		ISNULL(b.URL,'')<>''
	
		----specialOfferURL
		--update	a
		--set		a.Url=c.szURL,
		--		a.DisplayUrl=c.szDisplayURL,
		--		a.AgencyId=b.AgencyId,
		--		a.PartnerRID=b.lAdvertiserID
		--from	ListingStore2..acx_map_listingURL a
		--join	tblLP_ListingProcess b on (a.RID=b.RID and a.Identifier='LPSpecial1')
		--join	tblLP_BusSpecialOfferURL c on (b.lAdvertiserID=c.lAdvertiserID)
		--where	b.Termcode is null
		--and		ISNULL(c.szURL,'')<>''
		--and		a.AgencyId in ('AP','AF')
		--and		b.AgencyId in ('AP')
		
		--insert	ListingStore2..acx_map_listingURL(RID,Identifier,Url,DisplayUrl,DtAdd,PartnerRID,AgencyId,PriorityID,PositionCode,URLType)
		--select  b.RID,'LPSpecial1',c.szURL,c.szDisplayURL,GETDATE(),b.lAdvertiserID,b.AgencyId,0,'TP','WU'
		--from	tblLP_ListingProcess b
		--join	tblLP_BusSpecialOfferURL c on (b.lAdvertiserID=c.lAdvertiserID)
		--left join ListingStore2..acx_map_listingURL a on (a.RID=b.RID and a.AgencyID in ('AP','AF') and a.Identifier='LPSpecial1')
		--where	b.Termcode is null
		--and		ISNULL(c.szURL,'')<>''
		--and		b.AgencyId in ('AP')
		
		--Content
		select	b.Rid,b.ListingID,'Acxiom' as Identifier, NULL as ContentType, NULL as contentURL, Null as contentDisplayURL, Null as ContentTile,
			'<table cellpadding=5 cellspacing=5><tr><td>' +
				CASE
    				WHEN (isnull(b.email,'')='') THEN '' 
    				ELSE '<b>Business Email:</b><BR><a href="mailto:' + b.email + '">' + b.email + '</a><BR><BR>'  
				END 
			+ '<b>Additional Information:</b><BR>' + a.szBusDesc + '</td></tr></table>' as Content,
			b.lAdvertiserID as PartnerRid,
			b.Agencyid
		into	#tmp2_LPcontent	
		from	tblLP_ListingProcess b
		join	tblLP_BusDescription a on (b.lAdvertiserID=a.lAdvertiserID)
		where	b.Termcode is null
		and		ISNULL(a.szBusDesc,'')<>''

		delete	a 
		from	ListingStore2..acx_tbl_Content a
		join	#tmp2_LPcontent b on (a.RID=b.RID)
		where	a.AgencyId = 'AP'
		and		b.AgencyId = 'AF'

		delete	a 
		from	ListingStore2..acx_tbl_Content a
		join	#tmp2_LPcontent b on (a.RID=b.RID)
		where	a.AgencyId = 'AF'
		and		b.AgencyId = 'AP'
				
		update	a
		set		a.content=b.Content,
				a.AgencyID=b.AgencyId
		from	ListingStore2..acx_tbl_Content a
		join	#tmp2_LPcontent b on (a.RID=b.RID)
		where	a.AgencyID in ('AP','AF')
		and		a.content<>b.Content
		
		insert	ListingStore2..acx_tbl_Content(Listingid,RID,Identifier,ContentType,ContentURL,contentDisplayURL,contentTitle,content,PartnerRID,AgencyID)
		select	a.ListingID,a.RID,a.Identifier,a.ContentType,a.contentURL,a.contentDisplayURL,a.ContentTile,a.Content,a.PartnerRid,a.AgencyId
		from	#tmp2_LPcontent a
		left join ListingStore2..acx_tbl_Content b on (a.RID=b.RID and b.AgencyID in ('AP','AF'))
		where	b.RID is null
		
		drop table #tmp2_LPcontent
			
		--Result Desc
		select	b.RID,b.ListingID, Convert(Varchar(4000),LTrim(Replace( a.szBusDesc,'"',''))) as ResultDesc, b.lAdvertiserID as PartnerRid, b.AgencyID, getdate() as dtAdd 
		into	#tmp2_LPResultDesc
		from	tblLP_ListingProcess b
		join	tblLP_BusDescription a on (b.lAdvertiserID=a.lAdvertiserID)
		where	b.Termcode is null
		and		ISNULL(a.szBusDesc,'')<>''

		delete	a 
		from	ListingStore2..acx_tbl_ResultDesc a
		join	#tmp2_LPResultDesc b on (a.RID=b.RID)
		where	a.AgencyId = 'AP'
		and		b.AgencyId = 'AF'

		delete	a 
		from	ListingStore2..acx_tbl_ResultDesc a
		join	#tmp2_LPResultDesc b on (a.RID=b.RID)
		where	a.AgencyId = 'AF'
		and		b.AgencyId = 'AP'

		update	a
		set		a.ResultDesc=b.ResultDesc,
				a.AgencyID=b.AgencyId
		from	ListingStore2..acx_tbl_ResultDesc a
		join	#tmp2_LPResultDesc b on (a.RID=b.RID)
		where	a.AgencyID in ('AP','AF')
		and		a.ResultDesc<>b.ResultDesc
		
		insert	ListingStore2..acx_tbl_ResultDesc(Listingid,RID,ResultDesc,Advertiserid,AgencyID,dtAdd)
		select	a.ListingID,a.RID,a.ResultDesc,a.PartnerRid,a.AgencyId,a.dtAdd
		from	#tmp2_LPResultDesc a
		left join ListingStore2..acx_tbl_ResultDesc b on (a.RID=b.RID and b.AgencyID in ('AP','AF'))
		where	b.RID is null

		drop table #tmp2_LPResultDesc
	
	end
	
	EXEC msdb.dbo.sp_send_dbMail
		@profile_name = 'ReportingSvc', 
		@recipients ='sqlsupport@local.com',
		@subject='usp_DT_LocalPromote_Process of LA3SQL01\TonyStark finished successfully'


END

GO
