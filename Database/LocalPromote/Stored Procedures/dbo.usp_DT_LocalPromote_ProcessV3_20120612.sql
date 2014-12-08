SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_DT_LocalPromote_ProcessV3_20120612]
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

	if exists (select 1 from sys.objects where name='tblLP_ListingProcessV3' and type='U')
	drop table tblLP_ListingProcessV3
	
	create table tblLP_ListingProcessV3(
	[ListingID] [uniqueidentifier] NULL,
	[LocalID] [int] NULL,
	[AdvertiserID] [varchar](20) NOT NULL,
	[AgencyID] [varchar](10) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Latitude] [numeric](9, 6) NULL,
	[Longitude] [numeric](9, 6) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[zipCode] [varchar](5) NOT NULL,
	[Postal4] [varchar](4) NULL,
	[MainPhone] [varchar](20) NULL,
	[AlternatePhone] [varchar](20) NULL,
	[FaxPhone] [varchar](20) NULL,
	[LocalPhone] [varchar](20) NULL,
	[MobilePhone] [varchar](20) NULL,
	[Toll_FreePhone] [varchar](20) NULL,
	[TTY_Phone] [varchar](20) NULL,
	[ServiceArea] [varchar](300) NULL,
	[Tagline] [varchar](600) NULL,
	[twitter] [varchar](255) NULL,
	[YearEstablished] [varchar](50) NULL,
	[Associations] [varchar](600) NULL,
	[Brands] [varchar](max) NULL,
	[Certifications] [varchar](300) NULL,
	[description] [varchar](4000) NULL,
	[keywords] [varchar](4000) NULL,
	[Language] [varchar](255) NULL,
	[Neighborhooods] [varchar](255) NULL,
	[paymentOptions] [varchar](255) NULL,
	[Products] [varchar](max) NULL,
	[Services] [varchar](max) NULL,
	[Specialties] [varchar](max) NULL,
	[WebSite_URL] [varchar](600) NULL,
	[LOGO_URL] [varchar](600) NULL,
	[PHOTO_URL] [varchar](600) NULL,
	[VIDEO_URL] [varchar](600) NULL,
	[ATTRIBUTION_URL] [varchar](600) NULL,
	[MENU_URL] [varchar](600) NULL,
	[PRODUCTS_URL] [varchar](600) NULL,
	[EVENTS_URL] [varchar](600) NULL,
	[BIOS_URL] [varchar](600) NULL,
	[RESERVATION_URL] [varchar](8000) NULL,
	[ORDER_URL] [varchar](600) NULL,
	[SPECIAL_OFFER_URL] [varchar](600) NULL,
	[FACEBOOK_URL] [varchar](600) NULL,
	[AUDIO_URL] [varchar](600) NULL,
	[COUPON_URL] [varchar](600) NULL,
	[REVIEW_URL] [varchar](600) NULL,
	[MAP_URL] [varchar](600) NULL,
	[PHONE_TRACKING_URL] [varchar](600) NULL,
	[RATING_IMAGE_URL] [varchar](600) NULL,
	[TRACKING_URL] [varchar](600) NULL,
	[PROFILE_URL] [varchar](600) NULL,
	[Email] [varchar](600) NULL,
	[Hours] [varchar](300) NULL,
	[HoursAdditional] [varchar](300) NULL,
	[HoursMONStartEnd] [varchar](600) NULL,
	[HoursTUEStartEnd] [varchar](600) NULL,
	[HoursWEDStartEnd] [varchar](600) NULL,
	[HoursTHRStartEnd] [varchar](600) NULL,
	[HoursFRIStartEnd] [varchar](600) NULL,
	[HoursSATStartEnd] [varchar](600) NULL,
	[HoursSUNStartEnd] [varchar](600) NULL,
	[BDC1] [varchar](8) NULL,
	[categories1] [varchar](255) NULL,
	[BDC2] [varchar](8) NULL,
	[categories2] [varchar](255) NULL,
	[BDC3] [varchar](8) NULL,
	[categories3] [varchar](255) NULL,
	[BDC4] [varchar](8) NULL,
	[categories4] [varchar](255) NULL,
	[BDC5] [varchar](8) NULL,
	[categories5] [varchar](255) NULL,
	[BDC6] [varchar](8) NULL,
	[categories6] [varchar](255) NULL,
	[moreInfo] [varchar](600) NULL,
	[aaCoupons] [varchar](600) NULL,
	[QuestionAnswer] [varchar](600) NULL,
	[Closed] [varchar](50) NULL,
	[ClosedDate] [varchar](50) NULL,
	[VanityCityName] [varchar](255) NULL,
	[ContactFirstName] [varchar](50) NULL,
	[ContactLastName] [varchar](50) NULL,
	[ContactTitle] [varchar](50) NULL,
	[ContactGender] [varchar](50) NULL,
	[HideAddress] [varchar](10) NULL,
	[DoNotMail] [nvarchar](1) NULL,
	[DoNotCall] [nvarchar](1) NULL,
	[NoSolicitation] [varchar](10) NULL,
	[EthnicOwned] [varchar](10) NULL,
	[WomenOwned] [varchar](10) NULL,
	[DiscountCode] [varchar](255) NULL,
	[GeneralContent] [varchar](600) NULL,
	[Directions] [varchar](255) NULL,
	[Models] [varchar](max) NULL,
	[ProgramsOffered] [varchar](max) NULL,
	[ProductFeatures] [varchar](max) NULL,
	[ServiceFeatures] [varchar](max) NULL,
	[LocationFeatures] [varchar](max) NULL,
	[GroupsServed] [varchar](300) NULL,
	[IndustryType] [varchar](300) NULL,
	[SpecialConsiderations] [varchar](300) NULL,
	[OrderingMethods] [varchar](300) NULL,
	[ProfessionalsOnStaff] [varchar](300) NULL,
	[SIC1] [varchar](8) NULL,
	[SIC2] [varchar](8) NULL,
	[SIC3] [varchar](8) NULL,
	[SIC4] [varchar](8) NULL,
	[SIC5] [varchar](8) NULL,
	[SIC6] [varchar](8) NULL,
	[TitleSearch] [varchar](255) NULL,
	[AddressSearch] [varchar](255) NULL,
	[TermCode] [varchar](30) NULL,
	[Review_score] [decimal](4, 2) NULL,
	[Review_count] [int] NULL,
	[Review_Snippet] [varchar](600) NULL,
	[WebContent_URL] [varchar](600) NULL,
	[AdultFlag] [bit] NULL,
	[AcxiomMasterRecordId] [char](10) NULL,
	[AcxiomCHAINID] [varchar](50) NULL,
	[FileMaintenenceFlag] [varchar](1) NULL,
	[AdultContentFlag] [varchar](50) NULL,
	[BinaryChecksum_C]  AS (binary_checksum([LocalID],[AdvertiserID],[AgencyID],[Name],[Address],[City],[State],[Zipcode],[MainPhone],[Latitude],[Longitude],[Description],[Tagline],[BDC1],[BDC2],[BDC3],[BDC4],[BDC5],[BDC6],categories1,categories2,categories3,categories4,categories5,categories6,moreInfo,[WebSite_URL],[DONotCall],[DoNotMail],[AdultFlag],[HideAddress],[Review_score],[Review_count],[Review_Snippet],[Webcontent_URL],[Email],[Hours],[HoursMONStartEnd],[HoursTUEStartEnd],[HoursWEDStartEnd],[HoursTHRStartEnd],[HoursFRIStartEnd],[HoursSATStartEnd],[HoursSUNStartEnd],[Products],[Services])) persisted,
	[BinaryCheckSum_P]  AS (BINARY_CHECKSUM([LocalID],[AdvertiserID],[AgencyID],[Name],[Latitude],[Longitude],[Address],[City],[State],[zipCode],[Postal4],[MainPhone],[AlternatePhone],[FaxPhone],[LocalPhone],[MobilePhone],[Toll_FreePhone],[TTY_Phone],[ServiceArea],[Tagline],[twitter],[YearEstablished],[Associations],[Brands],[Certifications],[description],[keywords],[Language],[Neighborhooods],[paymentOptions],[Products],[Services],[Specialties],[WebSite_URL],[LOGO_URL],[PHOTO_URL],[VIDEO_URL],[ATTRIBUTION_URL],[MENU_URL],[PRODUCTS_URL],[EVENTS_URL],[BIOS_URL],[RESERVATION_URL],[ORDER_URL],[SPECIAL_OFFER_URL],[FACEBOOK_URL],[AUDIO_URL],[COUPON_URL],[REVIEW_URL],[MAP_URL],[PHONE_TRACKING_URL],[RATING_IMAGE_URL],[TRACKING_URL],[PROFILE_URL],
						[Email],[Hours],[HoursAdditional],[HoursMONStartEnd],[HoursTUEStartEnd],[HoursWEDStartEnd],[HoursTHRStartEnd],[HoursFRIStartEnd],[HoursSATStartEnd],[HoursSUNStartEnd],[BDC1],[categories1],[BDC2],[categories2],[BDC3],[categories3],[BDC4],[categories4],[BDC5],[categories5],[BDC6],[categories6],[moreInfo],[aaCoupons],[QuestionAnswer],[Closed],[ClosedDate],[VanityCityName],[ContactFirstName],[ContactLastName],[ContactTitle],[ContactGender],[HideAddress],[DoNotMail],[DoNotCall],[NoSolicitation],[EthnicOwned],[WomenOwned],[DiscountCode],[GeneralContent],[Directions],[Models],[ProgramsOffered],[ProductFeatures],[ServiceFeatures],[LocationFeatures],[GroupsServed],[IndustryType],[SpecialConsiderations],[OrderingMethods],[ProfessionalsOnStaff],[SIC1],[SIC2],[SIC3],[SIC4],[SIC5],[SIC6],
						[Review_score],[Review_count],[Review_Snippet],[WebContent_URL],[AdultFlag],AcxiomMasterRecordId,AcxiomCHAINID,FileMaintenenceFlag,AdultContentFlag)) persisted 
	)

	SELECT	a.lAdvertiserID	
		,row_number() over (partition by a.lAdvertiserID order by  a.sPrimary desc,a.BDC desc ,a.dtUpdate asc) as rnum
		,a.[BDC]
		,isnull(b.DisplayTitle,b.Title) as Title
	into	#LP_BDCs		
	FROM	[tblLP_BusListingCat] a
	join	glb_tbl_BDC b on (a.BDC=b.BDC)
	where	a.sAction <> 'DEL'
	and		a.lAdvertiserID <> 0

	create clustered index idx_bdc on #LP_BDCs(lAdvertiserID,rnum)

	INSERT	tblLP_ListingProcessV3
	( 		
	[LocalID],
	[AdvertiserID],
	[AgencyID],
	[Name],
	[Latitude],
	[Longitude],
	[Address],
	[City],
	[State],
	[zipCode],
	[Postal4],
	[MainPhone],
	[AlternatePhone],
	[FaxPhone],
	--[LocalPhone],
	--[MobilePhone],
	--[Toll_FreePhone],
	--[TTY_Phone],
	--[ServiceArea],
	[Tagline],
	[twitter],
	[YearEstablished],
	[Associations],
	[Brands],
	[Certifications],
	[description],
	[keywords],
	[Language],
	--[Neighborhooods],
	[paymentOptions],
	[Products],
	[Services],
	[Specialties],
	[WebSite_URL],
	[LOGO_URL],
	[PHOTO_URL],
	--[VIDEO_URL],
	--[ATTRIBUTION_URL],
	--[MENU_URL],
	--[PRODUCTS_URL],
	--[EVENTS_URL],
	--[BIOS_URL],
	--[RESERVATION_URL],
	--[ORDER_URL],
	--[SPECIAL_OFFER_URL],
	--[FACEBOOK_URL],
	--[AUDIO_URL],
	--[COUPON_URL],
	--[REVIEW_URL],
	--[MAP_URL],
	--[PHONE_TRACKING_URL],
	--[RATING_IMAGE_URL],
	--[TRACKING_URL],
	--[PROFILE_URL],
	[Email],
	[Hours],
	[HoursAdditional],
	[HoursMONStartEnd],
	[HoursTUEStartEnd],
	[HoursWEDStartEnd],
	[HoursTHRStartEnd],
	[HoursFRIStartEnd],
	[HoursSATStartEnd],
	[HoursSUNStartEnd],
	[BDC1],
	[categories1],
	[BDC2],
	[categories2],
	[BDC3],
	[categories3],
	[BDC4],
	[categories4],
	[BDC5],
	[categories5],
	[BDC6],
	[categories6],
	--[moreInfo],
	--[aaCoupons],
	--[QuestionAnswer],
	--[Closed],
	--[ClosedDate],
	--[VanityCityName],
	--[ContactFirstName],
	--[ContactLastName],
	--[ContactTitle],
	--[ContactGender],
	[HideAddress],
	--[DoNotMail],
	--[DoNotCall],
	--[NoSolicitation],
	[EthnicOwned],
	[WomenOwned],
	[DiscountCode]
	--[GeneralContent],
	--[Directions],
	--[Models],
	--[ProgramsOffered],
	--[ProductFeatures],
	--[ServiceFeatures],
	--[LocationFeatures],
	--[GroupsServed],
	--[IndustryType],
	--[SpecialConsiderations],
	--[OrderingMethods],
	--[ProfessionalsOnStaff],
	--[SIC1],
	--[SIC2],
	--[SIC3],
	--[SIC4],
	--[SIC5],
	--[SIC6],
	--[TitleSearch],
	--[AddressSearch],
	--[TermCode],
	--[Review_score],
	--[Review_count],
	--[Review_Snippet],
	--[WebContent_URL],
	--[AdultFlag],
	--[AcxiomMasterRecordId],
	--[AcxiomCHAINID],
	--[FileMaintenenceFlag],
	--[AdultContentFlag]
	)
	select	
		a.RIDAX as LocalID
		,a.lAdvertiserID as AdvertiserID
		,ISNULL(a.sAgencyID,'AF') as AgencyID
		,a.sztitle as Name
		,c.Latitude
		,c.Longitude
		,RTRIM(a.szStreetName+' '+ISNULL(a.szUnit,'')) as Address
		,a.szCity as City
		,a.sState as State
		,ListingStoreMaster.dbo.glb_fn_normalizeZipCode(a.sPostalCode) as Zipcode
		,a.sZip4 as Postal4
		,a.szPhone as MainPhone
		,a.szPhoneAlt as AlternatePhone
		,a.szFax as FaxPhone
		,e.szTagLine as Tagline
		,f.szTwitterName as twitter
		,e.szYearEstablished as YearEstablished
		,ac.Associations
		,ad.Brands
		,e.szCertification as Certifications
		,d.szBusDesc as description
		,ae.Keywords
		,aa.Language
		,ab.paymentOptions
		,ai.Products
		,aj.Services
		,ak.Specialties
		,a.szURL as WebSite_URL
		,ag.Logo_URL
		,LEFT(ah.Photo_URL,600)
		,a.szEmail as Email
		,case when ha.[24hrs]=1 then 'Open 24/7' else null end as Hours
		,coalesce(ha.szComment,hb.szComment) as HoursAdditional
		,case when ISDATE(hb.szOpenHour)=1 THEN '<dayHours day="MONDAY"><interval><start>'+ cast(cast(hb.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(hb.szCloseHour)=1 THEN cast(cast(hb.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursMONStartEnd]
		,case when ISDATE(hc.szOpenHour)=1 THEN '<dayHours day="TUEDAY"><interval><start>'+ cast(cast(hc.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(hc.szCloseHour)=1 THEN cast(cast(hc.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursTUEStartEnd]
		,case when ISDATE(hd.szOpenHour)=1 THEN '<dayHours day="WEDNESDAY"><interval><start>'+ cast(cast(hd.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(hd.szCloseHour)=1 THEN cast(cast(hd.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursWEDStartEnd]
		,case when ISDATE(he.szOpenHour)=1 THEN '<dayHours day="THURDAY"><interval><start>'+ cast(cast(he.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(he.szCloseHour)=1 THEN cast(cast(he.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursTHRStartEnd]
		,case when ISDATE(hf.szOpenHour)=1 THEN '<dayHours day="FRIDAY"><interval><start>'+ cast(cast(hf.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(hf.szCloseHour)=1 THEN cast(cast(hf.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursFRIStartEnd]
		,case when ISDATE(hg.szOpenHour)=1 THEN '<dayHours day="SATURDAY"><interval><start>'+ cast(cast(hg.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(hg.szCloseHour)=1 THEN cast(cast(hg.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursSATStartEnd]
		,case when ISDATE(hh.szOpenHour)=1 THEN '<dayHours day="SUNDAY"><interval><start>'+ cast(cast(hh.szOpenHour as time(0)) as varchar(20)) +'</start><end>'+case when ISDATE(hh.szCloseHour)=1 THEN cast(cast(hh.szCloseHour as time(0)) as varchar(20)) ELSE '' end+'</end></interval></dayHours>' ELSE NULL END as [HoursSUNStartEnd]
		,g1.BDC as BDC1
		,g1.Title as categories1
		,g2.BDC as BDC2
		,g2.Title as categories2
		,g3.BDC as BDC3
		,g3.Title as categories3
		,g4.BDC as BDC4
		,g4.Title as categories4
		,g5.BDC as BDC5
		,g5.Title as categories5
		,g6.BDC as BDC6
		,g6.Title as categories6
		,a.sHideAddress as HideAddress
		--,e.lLocationTotal
		--,e.lEmployeeTotal
		,e.sMinority as EthnicOwned
		,e.sFemale as womenOwned
		--,e.sEmergency 
		--,e.szAward
		,af.Discounts
	from	tblLP_BusListing a (nolock)
	join	tblLP_BusListingStatus b (nolock) on (a.lAdvertiserID=b.lAdvertiserID and b.sLastStatus='Y')
	left join	tblLP_BusListingLatLong c (nolock) on (a.lAdvertiserID=c.lAdvertiserID)
	left join	tblLP_BusDescription d (nolock) on (a.lAdvertiserID=d.lAdvertiserID)
	left join	tblLP_BusListingContent e (nolock) on (a.lAdvertiserID=e.lAdvertiserID)
	left join	tblLP_BusTwitter f (nolock) on (a.lAdvertiserID=f.lAdvertiserID and f.sActive='Y')
	outer apply (select top 1 1 as [24hrs],szComment from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.s24Hr='Y' and x.sHideHr='N'
				) as ha
	outer apply (select top 1 szOpenHour,szCloseHour,szComment from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='MON' and x.sHideHr='N'
				) as hb
	outer apply (select top 1 szOpenHour,szCloseHour from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='TUE' and x.sHideHr='N'
				) as hc
	outer apply (select top 1 szOpenHour,szCloseHour from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='WED' and x.sHideHr='N'
				) as hd
	outer apply (select top 1 szOpenHour,szCloseHour from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='THU' and x.sHideHr='N'
				) as he
	outer apply (select top 1 szOpenHour,szCloseHour from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='FRI' and x.sHideHr='N'
				) as hf
	outer apply (select top 1 szOpenHour,szCloseHour from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='SAT' and x.sHideHr='N'
				) as hg
	outer apply (select top 1 szOpenHour,szCloseHour from tblLP_BusHour x (nolock) 
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sDayOfWeek='SUN' and x.sHideHr='N'
				) as hh
	left join	#LP_BDCs g1 (nolock) on (a.lAdvertiserID=g1.lAdvertiserID and g1.rnum=1)
	left join	#LP_BDCs g2 (nolock) on (a.lAdvertiserID=g2.lAdvertiserID and g2.rnum=2)
	left join	#LP_BDCs g3 (nolock) on (a.lAdvertiserID=g3.lAdvertiserID and g3.rnum=3)
	left join	#LP_BDCs g4 (nolock) on (a.lAdvertiserID=g4.lAdvertiserID and g4.rnum=4)
	left join	#LP_BDCs g5 (nolock) on (a.lAdvertiserID=g5.lAdvertiserID and g5.rnum=5)
	left join	#LP_BDCs g6 (nolock) on (a.lAdvertiserID=g6.lAdvertiserID and g6.rnum=6)
	outer apply	(select stuff(( SELECT '|'+y.szLanguage FROM tblLP_BusLanguageSpoken x (nolock)
					join tblAL_Language y (nolock)on (x.lLanguageID=y.lLanguageID)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as aa(Language)
	outer apply	(select stuff(( SELECT '|'+y.szPymtDesc FROM tblLP_BusPaymentMethod x (nolock)
					join tblAL_PaymentType y (nolock)on (x.lPymtTypeID=y.lPymtTypeID)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as ab(paymentOptions)
	outer apply	(select stuff(( SELECT '|'+CASE WHEN x.lAssociationType=3 THEN x.szAssociationOther else y.szAssociationName end FROM tblLP_BusAssociation x (nolock)
					join tblLP_BusAssociationType y (nolock)on (x.lAssociationType=y.lAssociationType)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as ac(Associations)
	outer apply	(select stuff(( SELECT '|'+x.szBrandOfferDesc FROM tblLP_BusBrandOffered x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as ad(Brands)
	outer apply	(select stuff(( SELECT '|'+x.szKeyword FROM tblLP_AdvertiserKeyword x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as ae(Keywords)
	outer apply	(select stuff(( SELECT '|'+y.szDiscountName FROM tblLP_BusDiscount x (nolock)
					join tblLP_BusDiscountType y (nolock)on (x.lBusDiscountType=y.lBusDiscountType)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as af(Discounts)
	outer apply	(select stuff(( SELECT '|'+x.szFullLocation FROM tblLP_BusPhotoFile x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sPhotoType='LGO'
					for xml path('')),1,1,'')) as ag(Logo_URL)
	outer apply	(select stuff(( SELECT '|'+x.szFullLocation FROM tblLP_BusPhotoFile x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y' and x.sPhotoType='PTO'
					for xml path('')),1,1,'')) as ah(Photo_URL)
	outer apply	(select stuff(( SELECT '|'+x.szProductOfferDesc FROM tblLP_BusProductOffered x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as ai(Products)
	outer apply	(select stuff(( SELECT '|'+x.szServiceOfferDesc FROM tblLP_BusServiceOffered x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as aj(Services)
	outer apply	(select stuff(( SELECT '|'+x.szSpecialtyDesc FROM tblLP_BusSpecialty x (nolock)
					where x.lAdvertiserID=a.lAdvertiserID and x.sActive='Y'
					for xml path('')),1,1,'')) as ak(Specialties)
	where	a.sAction in ('ADD','UPD')
	and		b.sStatus in ('TRN','APV')

	drop table #LP_BDCs

	update	a
	set		a.agencyid = 'AP'
	from	tblLP_ListingProcessV3 a
	join	tblLP_ProductOrder b on (a.advertiserid = b.ladvertiserid and b.sActive='Y')

	/********************
	 Normalization 
	*********************/
	update	a
	set		a.zipcode=ListingStoreMaster.dbo.glb_fn_normalizeZipCode(a.zipcode),
			a.MainPhone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.MainPhone),
			a.AlternatePhone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.AlternatePhone),
			a.FaxPhone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.FaxPhone),
			a.LocalPhone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.LocalPhone),
			a.MobilePhone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.MobilePhone),
			a.Toll_FreePhone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.Toll_FreePhone),
			a.TTY_Phone=ListingStoreMaster.dbo.glb_fn_normalizePhoneNumber(a.TTY_Phone),
			a.Name=ListingStoreMaster.dbo.glb_fn_CapitalizeTitle(ListingStoreMaster.dbo.glb_fn_stripSpecialChars(a.Name)),
			a.Address=ListingStoreMaster.dbo.glb_fn_normalizeAddress(ListingStoreMaster.dbo.glb_fn_stripSpecialChars(a.Address))
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL

	update	a
	set		a.TermCode = 'BadZip'
	from	tblLP_ListingProcessV3 a
	where	a.zipcode is null

	update	a 
	set		a.TermCode = 'BadPhone'
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL
	and		a.MainPhone is NULL

	update	a 
	set		a.TermCode = 'BadTitle'
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL
	and		(a.Name is NULL or a.Name='' or len(a.Name)<2)

	update	a 
	set		a.Address='Serving Your Area'
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL
	and		(a.Address is NULL or a.Address='' or a.Address like 'Serving %')

	update	a 
	set		a.State=ListingStoreMaster.dbo.glb_fn_normalizeState(a.State,a.Zipcode),
			a.City=ListingStoreMaster.dbo.glb_fn_NormalizeCity(a.City,a.zipcode),
			a.titleSearch=ListingStoreMaster.dbo.glb_fn_titleSearch(a.Name),
			--a.TitleStrip=trackdb.dbo.ufn_StrippingTitle(a.Name),
			a.AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(a.Address)
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL
	
	update	a
	set		a.TermCode = 'BadState'
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL
	and		(a.State is null or len(a.state)<>2)

	update	a
	set		a.TermCode = 'BadCity'
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL
	and		(a.City is NULL or a.City='')

	UPDATE	a
	SET		a.WebSite_URL='http://'+LOWER(a.WebSite_URL)
	FROM	tblLP_ListingProcessV3 a
	WHERE	CHARINDEX('://',WebSite_URL) = 0
	
	/*******************************************
	 Mark Duplicate if Listing exists in LP 
	********************************************/
	update	a
	set		a.Termcode='DUPLICATE'
	from	tblLP_ListingProcessV3 a,
			tblLP_BusListing b (nolock)
	Where	a.MainPhone=b.szPhone	
	and		a.city=b.szCity
	and		a.state=b.sState
	and		a.ZipCode=b.sPostalCode
	and		a.AdvertiserID<>b.lAdvertiserID
	and		a.Termcode is null
	and		a.LocalID is null
	and		b.sAction in ('TRN')
	and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.szTitleSearch,1) > 70
				and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(a.AddressSearch,ListingStoreMaster.dbo.glb_fn_addressSearch(b.szStreetName)) > 65)
			or(AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(b.szStreetName)
				and		substring(a.Name,1,12)=substring(b.szTitle,1,12))
			)

	/*****************************************************
	 Find Duplicate with in tblLP_ListingProcessV3 
	******************************************************/
	update	a
	set		Listingid = NEWID()
	from	tblLP_ListingProcessV3 a
	where	a.TermCode is NULL

	select	distinct a.ListingID as ListID,len(a.Name) as titleLen,len(a.address) as adrsLen, b.ListingID as ListID2 
	into	#dupes_tmp1
	from	tblLP_ListingProcessV3 a (nolock),
			tblLP_ListingProcessV3 b
	Where	a.MainPhone=b.MainPhone
	and		a.city=b.city
	and		a.state=b.state
	and		a.ZipCode=b.ZipCode
	and		a.Listingid<>b.Listingid
	and		(( ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.TitleSearch,1) > 70 and ListingStoreMaster.dbo.glb_fn_addressMatchPerc(a.AddressSearch,b.AddressSearch) > 65)
			or	(a.AddressSearch=b.AddressSearch and SUBSTRING(a.Name,1,12)=SUBSTRING(b.Name,1,12)))
	and		a.ListingID is not null
	and		b.ListingID is not null

	create table #dupes_tmp2(ListID uniqueidentifier,lid uniqueidentifier)
	create clustered index idx_temp1_ListID on #dupes_tmp1(ListID)
	create index idx_temp2_ListID on #dupes_tmp2(ListID)
	
	declare		src_acx_cr cursor for
	select		ListID from #dupes_tmp1
	group by	ListID,adrsLen,titleLen
	order by	count(*) desc,adrsLen desc,titleLen asc 

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
	set		a.TermCode= 'DUPLICATE'
	from	tblLP_ListingProcessV3 a 
	join	#dupes_tmp2 b on (a.Listingid=b.ListID)
	where	b.ListID <> b.lid	
	and		a.ListingID is not null

	drop table #dupes_tmp1
	drop table #dupes_tmp2

	update	a
	set		Listingid = null
	from	tblLP_ListingProcessV3 a
	where	ListingID is not null
	
	/*******************************************
	 Get RID from match in profile 
	********************************************/
	if exists (select 1 from ListingStoreMaster..acx_ActiveListingStore where ActiveDB='ListingStore')
	begin	
		update	a
		set		LocalID=b.LocalID
		--		select *
		from	listingStore..ListingV3 b (nolock), tblLP_ListingProcessV3 a
		Where	a.LocalID is null 
		and		a.Termcode is null
		and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.TitleSearch,1) > 70
					and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(a.AddressSearch,ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)) > 65)
				or (a.AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)
					and		SUBSTRING(a.Name,1,12)=SUBSTRING(b.Name,1,12))
				)	
		and		a.city=b.city
		and		a.state=b.state
		and		a.ZipCode=b.ZipCode
		and		a.MainPhone=b.MainPhone
	end
	else
	begin
		update	a
		set		LocalID=b.LocalID
		--		select *
		from	listingStore2..ListingV3 b (nolock), tblLP_ListingProcessV3 a
		Where	a.LocalID is null 
		and		a.Termcode is null
		and		((ListingStoreMaster.dbo.glb_fn_titleMatchPerc(a.TitleSearch,b.TitleSearch,1) > 70
					and		ListingStoreMaster.dbo.glb_fn_addressMatchPerc(a.AddressSearch,ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)) > 65)
				or (a.AddressSearch=ListingStoreMaster.dbo.glb_fn_addressSearch(b.address)
					and		SUBSTRING(a.Name,1,12)=SUBSTRING(b.Name,1,12))
				)	
		and		a.city=b.city
		and		a.state=b.state
		and		a.ZipCode=b.ZipCode
		and		a.MainPhone=b.MainPhone
	end
	
	/***********************************
	 Generate New RIDs 
	************************************/
	create table #genNewRID(
		LocalID int not null IDENTITY(36510598,1),
		AdvertiserID varchar(20) not null
	)

	declare @LatestLocalID int
	select	@LatestLocalID=NextKey from [LA3SQL02\BruceWayne].trackload.dbo.tblAL_RIDGenerator

	SET IDENTITY_INSERT #genNewRID ON
	Insert	#genNewRID(LocalID, Advertiserid)
	select	@LatestLocalID+1,1
	SET IDENTITY_INSERT #genNewRID OFF

	delete	from #genNewRID

	INSERT	#genNewRID (Advertiserid)
	SELECT 	AdvertiserID 
	FROM 	tblLP_ListingProcessV3
	Where	LocalID is null
	and		Termcode is null

	UPDATE 	tblLP_ListingProcessV3
	SET 	LocalID=b.LocalID
	FROM 	tblLP_ListingProcessV3 a , #genNewRID b
	WHERE 	b.Advertiserid=a.AdvertiserID

	If (select max(LocalID) from tblLP_ListingProcessV3 where len(LocalID) < 10) > @LatestLocalID
	Begin
		Update	[LA3SQL02\BruceWayne].trackload.dbo.tblAL_RIDGenerator
		SET		Nextkey=(select max(LocalID) from tblLP_ListingProcessV3 where len(LocalID) < 10)
	End

	drop table #genNewRID

	--/************************************
	-- Generate New ListingIDs
	--*************************************/
	--truncate table tblAL_GetNewListingID
	
	--insert  tblAL_GetNewListingID(TableKey)
	--select	LocalID from tblLP_ListingProcessV3 
	--where	ListingID is null
	--and		Termcode is null

	--declare	@result int
	--exec	@result=[LA3SQL02\BruceWayne].TrackLoad.dbo.usp_DT_ListingID_gen
	--if (@result <> 0)
	--	raiserror('RPC usp_DT_ListingID_gen failed',16,1)
	
	--update	a
	--set		a.ListingID=b.ListingKey	
	--from	tblLP_ListingProcessV3 a	
	--join	tblAL_GetNewListingID b on (a.LocalID=b.TableKey)

	/*----------------------------------
	--UPDATE AdultFlag
	------------------------------------*/
	update	b
	set		AdultFlag = 1
	--		select b.RID,c.*
	from	tblLP_ListingProcessV3 b
	join	dbo.tblLP_BusListingCat c on (b.AdvertiserID=c.lAdvertiserID and c.sAction='ADD')
	join	ListingStoreMaster..glb_tbl_AdultBDC d on (c.BDC=d.BDC and d.ActiveFlag=1)

	/**********************
	 GeoCoding
	***********************/
	if exists (select 1 from sys.objects where name='tblLP_geocodeV3' and type='U')
	drop table tblLP_geocodeV3

	create table tblLP_geocodeV3
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
	from	tblLP_ListingProcessV3 a
	left join zipcodes z on (a.zipcode=z.zipcode and z.CityType='D')
	where	a.TermCode is null
	and		(Address like 'Serving %' or Address like 'PO Box%')

	select	LocalID as Rid,ListingStoreMaster.dbo.glb_fn_AddressLine1(Address) as Address,city,state,zipcode
	into	#tmpLP_geo
	from	tblLP_ListingProcessV3 
	where	TermCode is null
	and		Address not like 'Serving %' and Address not like 'PO Box%'

	update	a
	set		a.Latitude=g.Latitude,a.Longitude=g.Longitude
	from	tblLP_ListingProcessV3 a 
	join	#tmpLP_geo c on (a.LocalID=c.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	delete	c 
	from	#tmpLP_geo c 
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode g on (c.zipcode=g.zipcode and c.Address=g.Address and c.City=g.City and c.State=g.State)

	insert	tblLP_geocodeV3
	exec	ListingStoreMaster.dbo.glb_procMQ_geocode 'localpromote..#tmpLP_geo'

	delete	c 
	from	#tmpLP_geo c 
	join	tblLP_geocodeV3 b on (c.RID=b.LocalID)

	update	a 
	set		a.latitude=b.gLatitude,
			a.longitude=b.gLongitude
	from	tblLP_ListingProcessV3 a
	join	tblLP_geocodeV3 b on a.LocalID=b.LocalID
	where	(b.gConfidence like '[BILPZ][1-3]_AA' or b.gConfidence like '[BLPI][1-3]AA_' or b.gConfidence like '[BLPI][1-3]A_A' or b.gConfidence like '[LP]1BBA')

	update	a 
	set		a.latitude=coalesce(a.latitude,z.latitude*pi()/180,0),
			a.longitude=coalesce(a.longitude,z.longitude*pi()/180,0)
	from	tblLP_ListingProcessV3 a
	join	tblLP_geocodeV3 b on a.LocalID=b.LocalID
	left join zipcodes z on (a.ZipCode=z.ZIPCode and z.CityType='D')
	where	b.gConfidence not like '[BILPZ][1-3]_AA'
	and		b.gConfidence not like '[BLPI][1-3]AA_'
	and		b.gConfidence not like '[BLPI][1-3]A_A'
	and		b.gConfidence not like '[BLPI][1-3]_AA'
	and		b.gConfidence not like '[LP]1BBA'

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode(Address,City,State,Zipcode,Latitude,Longitude,Confidence,Entity,dtUpdate)
	select	distinct a.Address,a.City,a.State,a.Zipcode,convert(decimal(12,9),a.gLatitude),convert(decimal(12,9),a.gLongitude),a.gConfidence,a.gEntity,getdate() 
	from	tblLP_geocodeV3 a
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.glb_tbl_geocode b on (a.zipcode=b.zipcode and a.Address=b.Address and a.City=b.City and a.State=b.State)
	where	b.Address is null
	and		(a.gConfidence like '[BILPZ][1-3]_AA' or a.gConfidence like '[BLPI][1-3]AA_' or a.gConfidence like '[BLPI][1-3]A_A' or a.gConfidence like '[LP]1BBA')

	update	b
	set		address=ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address),city=a.city,state=a.state,zipcode=a.zipcode,latitude=a.latitude,longitude=a.longitude,AgencyID=a.AgencyID,AdvertiserID=a.AdvertiserID
	from	#tmpLP_geo t 
	join	tblLP_ListingProcessV3 a on (a.LocalID=t.RID)
	join	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.LocalID=b.RID

	insert	[LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode(RID,address,city,state,zipcode,latitude,longitude,AgencyID,AdvertiserID)
	select	a.LocalID,ListingStoreMaster.dbo.glb_fn_AddressLine1(a.address) as Address,a.city,a.state,a.zipcode,a.latitude,a.longitude,a.AgencyID,a.AdvertiserID 
	from	tblLP_ListingProcessV3 a 
	join	#tmpLP_geo t on a.LocalID=t.RID
	left join [LA3SQL02\BruceWayne].ListingStore_Staging.dbo.bingmap_regeocode b on a.LocalID=b.RID
	where	b.RID is null

	drop table #tmpLP_geo

	/**************************
	 LocalPromote
	***************************/

	/* BusListing */
	update	a
	set		a.sAgencyID = b.AgencyId,
			a.RIDAX = b.LocalID,
			a.szTitle = b.Name,
			a.szTitleSearch = b.TitleSearch,
			a.szTitleStrip = dbo.ufn_StrippingTitle(b.Name),
			a.szStreetName = b.Address,
			a.szCity = b.City,
			a.sState = isnull(b.State,a.sState),
			a.sPostalCode = isnull(b.ZipCode,a.sPostalCode),
			a.szPhone = isnull(b.MainPhone,a.szPhone),
			a.szURL = b.WebSite_URL,
			a.sHideAddress = b.HideAddress,
			a.dtAction = GETDATE(),
			a.saction = case when Termcode is null then 'TRN'
							 when Termcode='DUPLICATE' then 'DUP'
							 else 'BAD'
						end
	from	tblLP_BusListing a
	join	tblLP_ListingProcessV3 b on (a.lAdvertiserID=b.AdvertiserID)
	
	/* BusListingStatus */
	update	a
	set		a.sLastStatus='N'
	from	tblLP_BusListingStatus a
	join	tblLP_ListingProcessV3 b on (a.lAdvertiserID=b.AdvertiserID)
	where	a.sLastStatus='Y'
	
	insert	tblLP_BusListingstatus (lAdvertiserID,sStatus,sLastStatus,sActive,szUpdatedBy,dtStatus)
	select  Advertiserid, 
			case when Termcode is null then 'TRN'
				 when Termcode='DUPLICATE' then 'DND'
				 else 'ICP'
			end as sStatus,
			'Y' as sLastStatus,
			'Y' as sActive,
			'DT_LP_Process' as szUpdateBy,
			getdate() as dtStatus
	from	dbo.tblLP_ListingProcessV3

	/* BusListingLatLong */
	update	a
	set		a.Latitude=b.Latitude,
			a.Longitude=b.Longitude
	from	tblLP_BusListingLatLong a
	join	tblLP_ListingProcessV3 b on (a.lAdvertiserID=b.AdvertiserID)
	where	b.Termcode is null

	insert	tblLP_BusListingLatLong (lAdvertiserID,RIDAX,Latitude,Longitude,Geo,dtAdd)
	select	a.AdvertiserID,a.LocalID,a.Latitude,a.Longitude,'Y',GETDATE()
	from	tblLP_ListingProcessV3 a
	left join tblLP_BusListingLatLong b on (a.AdvertiserID=b.lAdvertiserID)
	where	b.lAdvertiserID is null
	and		a.Termcode is null
	and		a.Latitude is not null

	/* PartnerListing */
	--deactivate LED,PAY for unpaid
	Update	b
	set		sActive='N', dtActiveN=getdate()
	From	tblLP_PartnerListing b
	join	tblLP_ListingProcessV3 a on (a.Advertiserid=b.ladvertiserid and b.sActive='Y')
	where	b.sListingType in ('LED','PAY')
	and		a.TermCode IS NULL
	and		a.AgencyID = 'AF'

	--deactivate LED,FRE for paid
	Update	b
	set		sActive='N', dtActiveN=getdate()
	From	tblLP_PartnerListing b
	join	tblLP_ListingProcessV3 a on (a.Advertiserid=b.ladvertiserid and b.sActive='Y')
	where	b.sListingType in ('FRE','LED')
	and		a.TermCode IS NULL
	and		a.AgencyID = 'AP'

	--activate FRE for unpaid
	Update	b
	set		sActive='Y', dtActiveY=getdate() 
	From	tblLP_PartnerListing b
	join	tblLP_ListingProcessV3 a on (a.Advertiserid=b.ladvertiserid and b.sActive='N' and b.sListingType='FRE')
	where	a.TermCode IS NULL
	and		a.AgencyID = 'AF'


	--insert active FRE for unpaid
	Insert	tblLP_PartnerListing (lSiteID, lAdvertiserid, sActive, szUpdatedBy, dtActiveY, dtActiveN,sListingType)
	Select	2, advertiserid, 'Y' as sActive, 'DT_LP_Process', getdate(), null, 'FRE'
	from	dbo.tblLP_ListingProcessV3 a
	left join tblLP_PartnerListing b on (a.Advertiserid = b.lAdvertiserID and	b.sActive='Y' AND b.sListingType='FRE')
	where	b.lAdvertiserID is NULL
	and		a.TermCode IS NULL
	and		a.AgencyID = 'AF'

	--activate PAY for paid-site
	Update	b
	set		sActive='Y', dtActiveY=getdate()
	From	tblLP_PartnerListing b
	join	tblLP_ListingProcessV3 a on (a.Advertiserid=b.ladvertiserid)
	JOIN	(
			select	l.lAdvertiserID, c.lSiteID
			from	tblLP_BusListing l
			inner	join tblLP_ProductOrder o ON l.lAdvertiserID = o.lAdvertiserID and o.sActive = 'Y'
			inner	join tblLP_ProductCampaign c ON o.lCIDNo = c.lCIDNo
			) c ON b.lAdvertiserID=c.lAdvertiserID AND b.lSiteID = c.lSiteID and b.sActive='N' and b.sListingType='PAY'
	WHERE	a.TermCode IS NULL
	and		a.AgencyID = 'AP'

	--insert active PAY for paid-site
	Insert	tblLP_PartnerListing (lSiteID, lAdvertiserid, sActive, szUpdatedBy, dtActiveY, dtActiveN,sListingType)
	Select	c.lsiteid, a.advertiserid, 'Y' as sActive, 'DT_LP_Process', getdate(), null, 'PAY'
	from	dbo.tblLP_ListingProcessV3 a
	JOIN	(
			select	l.lAdvertiserID, c.lSiteID
			from	tblLP_BusListing l
			inner	join tblLP_ProductOrder o ON l.lAdvertiserID = o.lAdvertiserID and o.sActive = 'Y'
			inner	join tblLP_ProductCampaign c ON o.lCIDNo = c.lCIDNo
			) c ON a.AdvertiserID=c.lAdvertiserID
	left join Localpromote..tblLP_PartnerListing b on (c.lAdvertiserid = b.lAdvertiserID AND c.lSiteID = b.lSiteID AND b.sActive='Y' and b.sListingType='PAY')
	where	b.lAdvertiserID is NULL
	and		a.TermCode IS NULL
	and		a.AgencyID = 'AP'
	
	/**************************
	 Profile Database
	***************************/
		
	if exists (select 1 from ListingStoreMaster..acx_ActiveListingStore where ActiveDB='ListingStore')	
	begin
	-- ListingStore
		update a
		set	
			--a.[LocalID]=b.[LocalID],
			a.[AdvertiserID]=b.[AdvertiserID],
			a.[AgencyID]=b.[AgencyID],
			a.[Name]=b.[Name],
			a.[Latitude]=b.[Latitude],
			a.[Longitude]=b.[Longitude],
			a.[Address]=b.[Address],
			a.[City]=b.[City],
			a.[State]=b.[State],
			a.[zipCode]=b.[zipCode],
			a.[Postal4]=b.[Postal4],
			a.[MainPhone]=b.[MainPhone],
			a.[AlternatePhone]=b.[AlternatePhone],
			a.[FaxPhone]=b.[FaxPhone],
			a.[LocalPhone]=b.[LocalPhone],
			a.[MobilePhone]=b.[MobilePhone],
			a.[Toll_FreePhone]=b.[Toll_FreePhone],
			a.[TTY_Phone]=b.[TTY_Phone],
			a.[ServiceArea]=b.[ServiceArea],
			a.[Tagline]=b.[Tagline],
			a.[twitter]=b.[twitter],
			a.[YearEstablished]=b.[YearEstablished],
			a.[Associations]=b.[Associations],
			a.[Brands]=b.[Brands],
			a.[Certifications]=b.[Certifications],
			a.[description]=b.[description],
			a.[keywords]=b.[keywords],
			a.[Language]=b.[Language],
			a.[Neighborhooods]=b.[Neighborhooods],
			a.[paymentOptions]=b.[paymentOptions],
			a.[Products]=b.[Products],
			a.[Services]=b.[Services],
			a.[Specialties]=b.[Specialties],
			a.[WebSite_URL]=b.[WebSite_URL],
			a.[LOGO_URL]=b.[LOGO_URL],
			a.[PHOTO_URL]=b.[PHOTO_URL],
			a.[VIDEO_URL]=b.[VIDEO_URL],
			a.[ATTRIBUTION_URL]=b.[ATTRIBUTION_URL],
			a.[MENU_URL]=b.[MENU_URL],
			a.[PRODUCTS_URL]=b.[PRODUCTS_URL],
			a.[EVENTS_URL]=b.[EVENTS_URL],
			a.[BIOS_URL]=b.[BIOS_URL],
			a.[RESERVATION_URL]=b.[RESERVATION_URL],
			a.[ORDER_URL]=b.[ORDER_URL],
			a.[SPECIAL_OFFER_URL]=b.[SPECIAL_OFFER_URL],
			a.[FACEBOOK_URL]=b.[FACEBOOK_URL],
			a.[AUDIO_URL]=b.[AUDIO_URL],
			a.[COUPON_URL]=b.[COUPON_URL],
			a.[REVIEW_URL]=b.[REVIEW_URL],
			a.[MAP_URL]=b.[MAP_URL],
			a.[PHONE_TRACKING_URL]=b.[PHONE_TRACKING_URL],
			a.[RATING_IMAGE_URL]=b.[RATING_IMAGE_URL],
			a.[TRACKING_URL]=b.[TRACKING_URL],
			a.[PROFILE_URL]=b.[PROFILE_URL],
			a.[Email]=b.[Email],
			a.[Hours]=b.[Hours],
			a.[HoursAdditional]=b.[HoursAdditional],
			a.[HoursMONStartEnd]=b.[HoursMONStartEnd],
			a.[HoursTUEStartEnd]=b.[HoursTUEStartEnd],
			a.[HoursWEDStartEnd]=b.[HoursWEDStartEnd],
			a.[HoursTHRStartEnd]=b.[HoursTHRStartEnd],
			a.[HoursFRIStartEnd]=b.[HoursFRIStartEnd],
			a.[HoursSATStartEnd]=b.[HoursSATStartEnd],
			a.[HoursSUNStartEnd]=b.[HoursSUNStartEnd],
			a.[BDC1]=b.[BDC1],
			a.[categories1]=b.[categories1],
			a.[BDC2]=b.[BDC2],
			a.[categories2]=b.[categories2],
			a.[BDC3]=b.[BDC3],
			a.[categories3]=b.[categories3],
			a.[BDC4]=b.[BDC4],
			a.[categories4]=b.[categories4],
			a.[BDC5]=b.[BDC5],
			a.[categories5]=b.[categories5],
			a.[BDC6]=b.[BDC6],
			a.[categories6]=b.[categories6],
			a.[moreInfo]=b.[moreInfo],
			a.[aaCoupons]=b.[aaCoupons],
			a.[QuestionAnswer]=b.[QuestionAnswer],
			a.[Closed]=b.[Closed],
			a.[ClosedDate]=b.[ClosedDate],
			a.[VanityCityName]=b.[VanityCityName],
			a.[ContactFirstName]=b.[ContactFirstName],
			a.[ContactLastName]=b.[ContactLastName],
			a.[ContactTitle]=b.[ContactTitle],
			a.[ContactGender]=b.[ContactGender],
			a.[HideAddress]=b.[HideAddress],
			a.[DoNotMail]=b.[DoNotMail],
			a.[DoNotCall]=b.[DoNotCall],
			a.[NoSolicitation]=b.[NoSolicitation],
			a.[EthnicOwned]=b.[EthnicOwned],
			a.[WomenOwned]=b.[WomenOwned],
			a.[DiscountCode]=b.[DiscountCode],
			a.[GeneralContent]=b.[GeneralContent],
			a.[Directions]=b.[Directions],
			a.[Models]=b.[Models],
			a.[ProgramsOffered]=b.[ProgramsOffered],
			a.[ProductFeatures]=b.[ProductFeatures],
			a.[ServiceFeatures]=b.[ServiceFeatures],
			a.[LocationFeatures]=b.[LocationFeatures],
			a.[GroupsServed]=b.[GroupsServed],
			a.[IndustryType]=b.[IndustryType],
			a.[SpecialConsiderations]=b.[SpecialConsiderations],
			a.[OrderingMethods]=b.[OrderingMethods],
			a.[ProfessionalsOnStaff]=b.[ProfessionalsOnStaff],
			a.[SIC1]=b.[SIC1],
			a.[SIC2]=b.[SIC2],
			a.[SIC3]=b.[SIC3],
			a.[SIC4]=b.[SIC4],
			a.[SIC5]=b.[SIC5],
			a.[SIC6]=b.[SIC6],
			a.[TitleSearch]=b.[TitleSearch],
			a.[AddressSearch]=b.[AddressSearch],
			a.[TermCode]=b.[TermCode],
			a.[Review_score]=b.[Review_score],
			a.[Review_count]=b.[Review_count],
			a.[Review_Snippet]=b.[Review_Snippet],
			a.[WebContent_URL]=b.[WebContent_URL],
			a.[AdultFlag]=b.[AdultFlag],
			a.[AcxiomMasterRecordId]=b.[AcxiomMasterRecordId],
			a.[AcxiomCHAINID]=b.[AcxiomCHAINID],
			a.[FileMaintenenceFlag]=b.[FileMaintenenceFlag],
			a.[AdultContentFlag]=b.[AdultContentFlag]
		from ListingStore..ListingV3 a
		join dbo.tblLP_ListingProcessV3 b on a.LocalID=b.LocalID
		WHERE b.TermCode IS NULL
			
		insert ListingStore..ListingV3 (
			[LocalID],
			[AdvertiserID],
			[AgencyID],
			[Name],
			[Latitude],
			[Longitude],
			[Address],
			[City],
			[State],
			[zipCode],
			[Postal4],
			[MainPhone],
			[AlternatePhone],
			[FaxPhone],
			[LocalPhone],
			[MobilePhone],
			[Toll_FreePhone],
			[TTY_Phone],
			[ServiceArea],
			[Tagline],
			[twitter],
			[YearEstablished],
			[Associations],
			[Brands],
			[Certifications],
			[description],
			[keywords],
			[Language],
			[Neighborhooods],
			[paymentOptions],
			[Products],
			[Services],
			[Specialties],
			[WebSite_URL],
			[LOGO_URL],
			[PHOTO_URL],
			[VIDEO_URL],
			[ATTRIBUTION_URL],
			[MENU_URL],
			[PRODUCTS_URL],
			[EVENTS_URL],
			[BIOS_URL],
			[RESERVATION_URL],
			[ORDER_URL],
			[SPECIAL_OFFER_URL],
			[FACEBOOK_URL],
			[AUDIO_URL],
			[COUPON_URL],
			[REVIEW_URL],
			[MAP_URL],
			[PHONE_TRACKING_URL],
			[RATING_IMAGE_URL],
			[TRACKING_URL],
			[PROFILE_URL],
			[Email],
			[Hours],
			[HoursAdditional],
			[HoursMONStartEnd],
			[HoursTUEStartEnd],
			[HoursWEDStartEnd],
			[HoursTHRStartEnd],
			[HoursFRIStartEnd],
			[HoursSATStartEnd],
			[HoursSUNStartEnd],
			[BDC1],
			[categories1],
			[BDC2],
			[categories2],
			[BDC3],
			[categories3],
			[BDC4],
			[categories4],
			[BDC5],
			[categories5],
			[BDC6],
			[categories6],
			[moreInfo],
			[aaCoupons],
			[QuestionAnswer],
			[Closed],
			[ClosedDate],
			[VanityCityName],
			[ContactFirstName],
			[ContactLastName],
			[ContactTitle],
			[ContactGender],
			[HideAddress],
			[DoNotMail],
			[DoNotCall],
			[NoSolicitation],
			[EthnicOwned],
			[WomenOwned],
			[DiscountCode],
			[GeneralContent],
			[Directions],
			[Models],
			[ProgramsOffered],
			[ProductFeatures],
			[ServiceFeatures],
			[LocationFeatures],
			[GroupsServed],
			[IndustryType],
			[SpecialConsiderations],
			[OrderingMethods],
			[ProfessionalsOnStaff],
			[SIC1],
			[SIC2],
			[SIC3],
			[SIC4],
			[SIC5],
			[SIC6],
			[TitleSearch],
			[AddressSearch],
			[TermCode],
			[Review_score],
			[Review_count],
			[Review_Snippet],
			[WebContent_URL],
			[AdultFlag],
			[AcxiomMasterRecordId],
			[AcxiomCHAINID],
			[FileMaintenenceFlag],
			[AdultContentFlag]
		)
		select 
			b.[LocalID],
			b.[AdvertiserID],
			b.[AgencyID],
			b.[Name],
			b.[Latitude],
			b.[Longitude],
			b.[Address],
			b.[City],
			b.[State],
			b.[zipCode],
			b.[Postal4],
			b.[MainPhone],
			b.[AlternatePhone],
			b.[FaxPhone],
			b.[LocalPhone],
			b.[MobilePhone],
			b.[Toll_FreePhone],
			b.[TTY_Phone],
			b.[ServiceArea],
			b.[Tagline],
			b.[twitter],
			b.[YearEstablished],
			b.[Associations],
			b.[Brands],
			b.[Certifications],
			b.[description],
			b.[keywords],
			b.[Language],
			b.[Neighborhooods],
			b.[paymentOptions],
			b.[Products],
			b.[Services],
			b.[Specialties],
			b.[WebSite_URL],
			b.[LOGO_URL],
			b.[PHOTO_URL],
			b.[VIDEO_URL],
			b.[ATTRIBUTION_URL],
			b.[MENU_URL],
			b.[PRODUCTS_URL],
			b.[EVENTS_URL],
			b.[BIOS_URL],
			b.[RESERVATION_URL],
			b.[ORDER_URL],
			b.[SPECIAL_OFFER_URL],
			b.[FACEBOOK_URL],
			b.[AUDIO_URL],
			b.[COUPON_URL],
			b.[REVIEW_URL],
			b.[MAP_URL],
			b.[PHONE_TRACKING_URL],
			b.[RATING_IMAGE_URL],
			b.[TRACKING_URL],
			b.[PROFILE_URL],
			b.[Email],
			b.[Hours],
			b.[HoursAdditional],
			b.[HoursMONStartEnd],
			b.[HoursTUEStartEnd],
			b.[HoursWEDStartEnd],
			b.[HoursTHRStartEnd],
			b.[HoursFRIStartEnd],
			b.[HoursSATStartEnd],
			b.[HoursSUNStartEnd],
			b.[BDC1],
			b.[categories1],
			b.[BDC2],
			b.[categories2],
			b.[BDC3],
			b.[categories3],
			b.[BDC4],
			b.[categories4],
			b.[BDC5],
			b.[categories5],
			b.[BDC6],
			b.[categories6],
			b.[moreInfo],
			b.[aaCoupons],
			b.[QuestionAnswer],
			b.[Closed],
			b.[ClosedDate],
			b.[VanityCityName],
			b.[ContactFirstName],
			b.[ContactLastName],
			b.[ContactTitle],
			b.[ContactGender],
			b.[HideAddress],
			b.[DoNotMail],
			b.[DoNotCall],
			b.[NoSolicitation],
			b.[EthnicOwned],
			b.[WomenOwned],
			b.[DiscountCode],
			b.[GeneralContent],
			b.[Directions],
			b.[Models],
			b.[ProgramsOffered],
			b.[ProductFeatures],
			b.[ServiceFeatures],
			b.[LocationFeatures],
			b.[GroupsServed],
			b.[IndustryType],
			b.[SpecialConsiderations],
			b.[OrderingMethods],
			b.[ProfessionalsOnStaff],
			b.[SIC1],
			b.[SIC2],
			b.[SIC3],
			b.[SIC4],
			b.[SIC5],
			b.[SIC6],
			b.[TitleSearch],
			b.[AddressSearch],
			b.[TermCode],
			b.[Review_score],
			b.[Review_count],
			b.[Review_Snippet],
			b.[WebContent_URL],
			b.[AdultFlag],
			b.[AcxiomMasterRecordId],
			b.[AcxiomCHAINID],
			b.[FileMaintenenceFlag],
			b.[AdultContentFlag]
		from dbo.tblLP_ListingProcessV3 b
		left join ListingStore..ListingV3 a on a.LocalID=b.LocalID
		where a.LocalID is NULL
		AND b.TermCode IS NULL

	end
	else
	begin
	--ListingStore2
		update a
		set	
			--a.[LocalID]=b.[LocalID],
			a.[AdvertiserID]=b.[AdvertiserID],
			a.[AgencyID]=b.[AgencyID],
			a.[Name]=b.[Name],
			a.[Latitude]=b.[Latitude],
			a.[Longitude]=b.[Longitude],
			a.[Address]=b.[Address],
			a.[City]=b.[City],
			a.[State]=b.[State],
			a.[zipCode]=b.[zipCode],
			a.[Postal4]=b.[Postal4],
			a.[MainPhone]=b.[MainPhone],
			a.[AlternatePhone]=b.[AlternatePhone],
			a.[FaxPhone]=b.[FaxPhone],
			a.[LocalPhone]=b.[LocalPhone],
			a.[MobilePhone]=b.[MobilePhone],
			a.[Toll_FreePhone]=b.[Toll_FreePhone],
			a.[TTY_Phone]=b.[TTY_Phone],
			a.[ServiceArea]=b.[ServiceArea],
			a.[Tagline]=b.[Tagline],
			a.[twitter]=b.[twitter],
			a.[YearEstablished]=b.[YearEstablished],
			a.[Associations]=b.[Associations],
			a.[Brands]=b.[Brands],
			a.[Certifications]=b.[Certifications],
			a.[description]=b.[description],
			a.[keywords]=b.[keywords],
			a.[Language]=b.[Language],
			a.[Neighborhooods]=b.[Neighborhooods],
			a.[paymentOptions]=b.[paymentOptions],
			a.[Products]=b.[Products],
			a.[Services]=b.[Services],
			a.[Specialties]=b.[Specialties],
			a.[WebSite_URL]=b.[WebSite_URL],
			a.[LOGO_URL]=b.[LOGO_URL],
			a.[PHOTO_URL]=b.[PHOTO_URL],
			a.[VIDEO_URL]=b.[VIDEO_URL],
			a.[ATTRIBUTION_URL]=b.[ATTRIBUTION_URL],
			a.[MENU_URL]=b.[MENU_URL],
			a.[PRODUCTS_URL]=b.[PRODUCTS_URL],
			a.[EVENTS_URL]=b.[EVENTS_URL],
			a.[BIOS_URL]=b.[BIOS_URL],
			a.[RESERVATION_URL]=b.[RESERVATION_URL],
			a.[ORDER_URL]=b.[ORDER_URL],
			a.[SPECIAL_OFFER_URL]=b.[SPECIAL_OFFER_URL],
			a.[FACEBOOK_URL]=b.[FACEBOOK_URL],
			a.[AUDIO_URL]=b.[AUDIO_URL],
			a.[COUPON_URL]=b.[COUPON_URL],
			a.[REVIEW_URL]=b.[REVIEW_URL],
			a.[MAP_URL]=b.[MAP_URL],
			a.[PHONE_TRACKING_URL]=b.[PHONE_TRACKING_URL],
			a.[RATING_IMAGE_URL]=b.[RATING_IMAGE_URL],
			a.[TRACKING_URL]=b.[TRACKING_URL],
			a.[PROFILE_URL]=b.[PROFILE_URL],
			a.[Email]=b.[Email],
			a.[Hours]=b.[Hours],
			a.[HoursAdditional]=b.[HoursAdditional],
			a.[HoursMONStartEnd]=b.[HoursMONStartEnd],
			a.[HoursTUEStartEnd]=b.[HoursTUEStartEnd],
			a.[HoursWEDStartEnd]=b.[HoursWEDStartEnd],
			a.[HoursTHRStartEnd]=b.[HoursTHRStartEnd],
			a.[HoursFRIStartEnd]=b.[HoursFRIStartEnd],
			a.[HoursSATStartEnd]=b.[HoursSATStartEnd],
			a.[HoursSUNStartEnd]=b.[HoursSUNStartEnd],
			a.[BDC1]=b.[BDC1],
			a.[categories1]=b.[categories1],
			a.[BDC2]=b.[BDC2],
			a.[categories2]=b.[categories2],
			a.[BDC3]=b.[BDC3],
			a.[categories3]=b.[categories3],
			a.[BDC4]=b.[BDC4],
			a.[categories4]=b.[categories4],
			a.[BDC5]=b.[BDC5],
			a.[categories5]=b.[categories5],
			a.[BDC6]=b.[BDC6],
			a.[categories6]=b.[categories6],
			a.[moreInfo]=b.[moreInfo],
			a.[aaCoupons]=b.[aaCoupons],
			a.[QuestionAnswer]=b.[QuestionAnswer],
			a.[Closed]=b.[Closed],
			a.[ClosedDate]=b.[ClosedDate],
			a.[VanityCityName]=b.[VanityCityName],
			a.[ContactFirstName]=b.[ContactFirstName],
			a.[ContactLastName]=b.[ContactLastName],
			a.[ContactTitle]=b.[ContactTitle],
			a.[ContactGender]=b.[ContactGender],
			a.[HideAddress]=b.[HideAddress],
			a.[DoNotMail]=b.[DoNotMail],
			a.[DoNotCall]=b.[DoNotCall],
			a.[NoSolicitation]=b.[NoSolicitation],
			a.[EthnicOwned]=b.[EthnicOwned],
			a.[WomenOwned]=b.[WomenOwned],
			a.[DiscountCode]=b.[DiscountCode],
			a.[GeneralContent]=b.[GeneralContent],
			a.[Directions]=b.[Directions],
			a.[Models]=b.[Models],
			a.[ProgramsOffered]=b.[ProgramsOffered],
			a.[ProductFeatures]=b.[ProductFeatures],
			a.[ServiceFeatures]=b.[ServiceFeatures],
			a.[LocationFeatures]=b.[LocationFeatures],
			a.[GroupsServed]=b.[GroupsServed],
			a.[IndustryType]=b.[IndustryType],
			a.[SpecialConsiderations]=b.[SpecialConsiderations],
			a.[OrderingMethods]=b.[OrderingMethods],
			a.[ProfessionalsOnStaff]=b.[ProfessionalsOnStaff],
			a.[SIC1]=b.[SIC1],
			a.[SIC2]=b.[SIC2],
			a.[SIC3]=b.[SIC3],
			a.[SIC4]=b.[SIC4],
			a.[SIC5]=b.[SIC5],
			a.[SIC6]=b.[SIC6],
			a.[TitleSearch]=b.[TitleSearch],
			a.[AddressSearch]=b.[AddressSearch],
			a.[TermCode]=b.[TermCode],
			a.[Review_score]=b.[Review_score],
			a.[Review_count]=b.[Review_count],
			a.[Review_Snippet]=b.[Review_Snippet],
			a.[WebContent_URL]=b.[WebContent_URL],
			a.[AdultFlag]=b.[AdultFlag],
			a.[AcxiomMasterRecordId]=b.[AcxiomMasterRecordId],
			a.[AcxiomCHAINID]=b.[AcxiomCHAINID],
			a.[FileMaintenenceFlag]=b.[FileMaintenenceFlag],
			a.[AdultContentFlag]=b.[AdultContentFlag]
		from ListingStore2..ListingV3 a
		join dbo.tblLP_ListingProcessV3 b on a.LocalID=b.LocalID
		WHERE b.TermCode IS NULL
			
		insert ListingStore2..ListingV3 (
			[LocalID],
			[AdvertiserID],
			[AgencyID],
			[Name],
			[Latitude],
			[Longitude],
			[Address],
			[City],
			[State],
			[zipCode],
			[Postal4],
			[MainPhone],
			[AlternatePhone],
			[FaxPhone],
			[LocalPhone],
			[MobilePhone],
			[Toll_FreePhone],
			[TTY_Phone],
			[ServiceArea],
			[Tagline],
			[twitter],
			[YearEstablished],
			[Associations],
			[Brands],
			[Certifications],
			[description],
			[keywords],
			[Language],
			[Neighborhooods],
			[paymentOptions],
			[Products],
			[Services],
			[Specialties],
			[WebSite_URL],
			[LOGO_URL],
			[PHOTO_URL],
			[VIDEO_URL],
			[ATTRIBUTION_URL],
			[MENU_URL],
			[PRODUCTS_URL],
			[EVENTS_URL],
			[BIOS_URL],
			[RESERVATION_URL],
			[ORDER_URL],
			[SPECIAL_OFFER_URL],
			[FACEBOOK_URL],
			[AUDIO_URL],
			[COUPON_URL],
			[REVIEW_URL],
			[MAP_URL],
			[PHONE_TRACKING_URL],
			[RATING_IMAGE_URL],
			[TRACKING_URL],
			[PROFILE_URL],
			[Email],
			[Hours],
			[HoursAdditional],
			[HoursMONStartEnd],
			[HoursTUEStartEnd],
			[HoursWEDStartEnd],
			[HoursTHRStartEnd],
			[HoursFRIStartEnd],
			[HoursSATStartEnd],
			[HoursSUNStartEnd],
			[BDC1],
			[categories1],
			[BDC2],
			[categories2],
			[BDC3],
			[categories3],
			[BDC4],
			[categories4],
			[BDC5],
			[categories5],
			[BDC6],
			[categories6],
			[moreInfo],
			[aaCoupons],
			[QuestionAnswer],
			[Closed],
			[ClosedDate],
			[VanityCityName],
			[ContactFirstName],
			[ContactLastName],
			[ContactTitle],
			[ContactGender],
			[HideAddress],
			[DoNotMail],
			[DoNotCall],
			[NoSolicitation],
			[EthnicOwned],
			[WomenOwned],
			[DiscountCode],
			[GeneralContent],
			[Directions],
			[Models],
			[ProgramsOffered],
			[ProductFeatures],
			[ServiceFeatures],
			[LocationFeatures],
			[GroupsServed],
			[IndustryType],
			[SpecialConsiderations],
			[OrderingMethods],
			[ProfessionalsOnStaff],
			[SIC1],
			[SIC2],
			[SIC3],
			[SIC4],
			[SIC5],
			[SIC6],
			[TitleSearch],
			[AddressSearch],
			[TermCode],
			[Review_score],
			[Review_count],
			[Review_Snippet],
			[WebContent_URL],
			[AdultFlag],
			[AcxiomMasterRecordId],
			[AcxiomCHAINID],
			[FileMaintenenceFlag],
			[AdultContentFlag]
		)
		select 
			b.[LocalID],
			b.[AdvertiserID],
			b.[AgencyID],
			b.[Name],
			b.[Latitude],
			b.[Longitude],
			b.[Address],
			b.[City],
			b.[State],
			b.[zipCode],
			b.[Postal4],
			b.[MainPhone],
			b.[AlternatePhone],
			b.[FaxPhone],
			b.[LocalPhone],
			b.[MobilePhone],
			b.[Toll_FreePhone],
			b.[TTY_Phone],
			b.[ServiceArea],
			b.[Tagline],
			b.[twitter],
			b.[YearEstablished],
			b.[Associations],
			b.[Brands],
			b.[Certifications],
			b.[description],
			b.[keywords],
			b.[Language],
			b.[Neighborhooods],
			b.[paymentOptions],
			b.[Products],
			b.[Services],
			b.[Specialties],
			b.[WebSite_URL],
			b.[LOGO_URL],
			b.[PHOTO_URL],
			b.[VIDEO_URL],
			b.[ATTRIBUTION_URL],
			b.[MENU_URL],
			b.[PRODUCTS_URL],
			b.[EVENTS_URL],
			b.[BIOS_URL],
			b.[RESERVATION_URL],
			b.[ORDER_URL],
			b.[SPECIAL_OFFER_URL],
			b.[FACEBOOK_URL],
			b.[AUDIO_URL],
			b.[COUPON_URL],
			b.[REVIEW_URL],
			b.[MAP_URL],
			b.[PHONE_TRACKING_URL],
			b.[RATING_IMAGE_URL],
			b.[TRACKING_URL],
			b.[PROFILE_URL],
			b.[Email],
			b.[Hours],
			b.[HoursAdditional],
			b.[HoursMONStartEnd],
			b.[HoursTUEStartEnd],
			b.[HoursWEDStartEnd],
			b.[HoursTHRStartEnd],
			b.[HoursFRIStartEnd],
			b.[HoursSATStartEnd],
			b.[HoursSUNStartEnd],
			b.[BDC1],
			b.[categories1],
			b.[BDC2],
			b.[categories2],
			b.[BDC3],
			b.[categories3],
			b.[BDC4],
			b.[categories4],
			b.[BDC5],
			b.[categories5],
			b.[BDC6],
			b.[categories6],
			b.[moreInfo],
			b.[aaCoupons],
			b.[QuestionAnswer],
			b.[Closed],
			b.[ClosedDate],
			b.[VanityCityName],
			b.[ContactFirstName],
			b.[ContactLastName],
			b.[ContactTitle],
			b.[ContactGender],
			b.[HideAddress],
			b.[DoNotMail],
			b.[DoNotCall],
			b.[NoSolicitation],
			b.[EthnicOwned],
			b.[WomenOwned],
			b.[DiscountCode],
			b.[GeneralContent],
			b.[Directions],
			b.[Models],
			b.[ProgramsOffered],
			b.[ProductFeatures],
			b.[ServiceFeatures],
			b.[LocationFeatures],
			b.[GroupsServed],
			b.[IndustryType],
			b.[SpecialConsiderations],
			b.[OrderingMethods],
			b.[ProfessionalsOnStaff],
			b.[SIC1],
			b.[SIC2],
			b.[SIC3],
			b.[SIC4],
			b.[SIC5],
			b.[SIC6],
			b.[TitleSearch],
			b.[AddressSearch],
			b.[TermCode],
			b.[Review_score],
			b.[Review_count],
			b.[Review_Snippet],
			b.[WebContent_URL],
			b.[AdultFlag],
			b.[AcxiomMasterRecordId],
			b.[AcxiomCHAINID],
			b.[FileMaintenenceFlag],
			b.[AdultContentFlag]
		from dbo.tblLP_ListingProcessV3 b
		left join ListingStore2..ListingV3 a on a.LocalID=b.LocalID
		where a.LocalID is NULL
		AND b.TermCode IS NULL

	end
	
	EXEC msdb.dbo.sp_send_dbMail
		@profile_name = 'ReportingSvc', 
		@recipients ='sqlsupport@local.com',
		@subject='usp_DT_LocalPromote_Process of LA3SQL01\TonyStark finished successfully'


END





GO
