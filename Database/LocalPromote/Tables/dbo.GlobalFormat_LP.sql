CREATE TABLE [dbo].[GlobalFormat_LP]
(
[LocalID] [int] NULL,
[AdvertiserID] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgencyID] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcxiomMasterRecordId] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcxiomCHAINID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FileMaintenenceFlag] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Latitude] [numeric] (9, 6) NULL,
[Longitude] [numeric] (9, 6) NULL,
[Address] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zipCode] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Postal4] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MainPhone] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AlternatePhone] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FaxPhone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocalPhone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Toll_FreePhone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TTY_Phone] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceArea] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tagline] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[twitter] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YearEstablished] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Associations] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Brands] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Certifications] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[description] [varchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[keywords] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Language] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Neighborhooods] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[paymentOptions] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Products] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Services] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Specialties] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WebSite_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOGO_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHOTO_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VIDEO_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ATTRIBUTION_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MENU_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRODUCTS_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EVENTS_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIOS_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RESERVATION_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORDER_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SPECIAL_OFFER_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FACEBOOK_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AUDIO_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUPON_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REVIEW_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAP_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE_TRACKING_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RATING_IMAGE_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRACKING_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROFILE_URL] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Hours] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursAdditional] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursMONStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursTUEStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursWEDStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursTHRStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursFRIStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursSATStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HoursSUNStartEnd] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC1] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categories1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC2] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categories2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC3] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categories3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC4] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categories4] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC5] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categories5] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BDC6] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[categories6] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[moreInfo] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[aaCoupons] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QuestionAnswer] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Closed] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ClosedDate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VanityCityName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactTitle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactGender] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HideAddress] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DoNotMail] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DoNotCall] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NoSolicitation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdultContentFlag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EthnicOwned] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WomenOwned] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DiscountCode] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GeneralContent] [varchar] (600) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Directions] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Models] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProgramsOffered] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProductFeatures] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ServiceFeatures] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LocationFeatures] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupsServed] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndustryType] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SpecialConsiderations] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OrderingMethods] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProfessionalsOnStaff] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC1] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC2] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC3] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC4] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC5] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC6] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TitleSearch] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressSearch] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TermCode] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
