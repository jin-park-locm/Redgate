SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Listing_By_ID]     @TableKey				int				--= NULL    ,@PartnerID				int				= NULL--  ,@RLoad					char(1)			= 'Y'    ,@dtAdd					datetime        = NULL    ,@SiteID				int				= NULL    ,@Distrib				char(3)			= NULL--  ,@Reason				varchar(50)		= NULL    ,@RID					int				= NULL    ,@Ridax					int				= NULL    ,@UserCID				varchar(20)		= NULL    ,@LeadCID				varchar(15)		= NULL    ,@LeadOrigKey			int				= NULL    ,@AgencyLogin			varchar(20)		= NULL    ,@HideAddress			char(1)			= NULL    ,@SalePerson			varchar(50)		= NULL    ,@SalePersonID			int				= NULL    ,@Status				char(3)			= NULL    ,@Action				char(3)			= NULL    ,@AdvertiserFirstName	varchar(50)		= NULL    ,@AdvertiserLastName	varchar(50)		= NULL    ,@ContactPhone			varchar(50)		= NULL    ,@Email					varchar(155)    = NULL    ,@CompanyID				varchar(100)    = NULL    ,@CompanyName			varchar(250)    = NULL    ,@Address				varchar(100)    = NULL    ,@City					varchar(60)		= NULL    ,@State					char(2)			= NULL    ,@ZipCode				char(5)			= NULL    ,@Phone					char(10)		= NULL    ,@AltPhone				char(10)		= NULL    ,@BusEmail				varchar(150)    = NULL    ,@BDCCategoryID			int				= NULL    ,@URL					varchar(250)    = NULL    ,@DisplayURL			varchar(250)    = NULL    ,@ClickURL				varchar(250)    = NULL    ,@Title					varchar(155)    = NULL    ,@TagLine				varchar(150)    = NULL    ,@Description			varchar(max)    = NULL    ,@LDACDescription		varchar(max)    = NULL    ,@BusService			varchar(500)    = NULL    ,@Brand					varchar(500)    = NULL    ,@BusSpecialty			varchar(1000)   = NULL    ,@BeginSubscription		datetime        = NULL    ,@EndSubscription		datetime        = NULL    ,@Keywords				varchar(4000)   = NULL    ,@KeyCode				varchar(400)    = NULL    ,@BDC1					int				= NULL    ,@BDC2					int				= NULL    ,@BDC3					int				= NULL    ,@BDC4					int				= NULL    ,@ServiceCounty			varchar(50)		= NULL    ,@ServiceCountySt		char(2)			= NULL    ,@ServiceCounty2		varchar(50)		= NULL
    ,@ServiceCountySt2		char(2)			= NULL    ,@ServiceCounty3		varchar(50)		= NULL    ,@ServiceCountySt3		char(2)			= NULL    ,@ServiceCounty4		varchar(50)		= NULL    ,@ServiceCountySt4		char(2)			= NULL    ,@ServiceCounty5		varchar(50)		= NULL    ,@ServiceCountyST5		char(2)			= NULL    ,@Advertiserid			int				= NULL    ,@MemberID				int				= NULL    ,@OrderID				int				= NULL    ,@PymTypeID				int				= NULL    ,@billingMethod			int				= NULL    ,@Source				varchar(3)		= NULL    ,@AdCost				numeric			= NULL    ,@CCLast4				char(4)			= NULL    ,@MktCode				int				= NULL    ,@DispCode				char(5)			= NULL    ,@Listingid				uniqueidentifier= NULL    ,@UpdatedBy				varchar(20)		= NULL    ,@YearEst				varchar(10)		= NULL    ,@NumEmployee			varchar(10)		= NULL    ,@NumLocation			varchar(10)		= NULL    ,@BusProduct			varchar(2000)   = NULL    ,@Language1				varchar(20)		= NULL    ,@LanguageID1			int				= NULL    ,@Language2				varchar(20)		= NULL    ,@LanguageID2			int				= NULL    ,@Language3				varchar(20)		= NULL    ,@LanguageID3			int				= NULL    ,@URLSpecial1			varchar(250)    = NULL    ,@URLSpecial2			varchar(250)    = NULL    ,@Pymt_Cash				char(1)			= NULL    ,@Pymt_MC				char(1)			= NULL    ,@Pymt_Visa				char(1)			= NULL
    ,@Pymt_Check			char(1)			= NULL    ,@Pymt_Discover			char(1)			= NULL    ,@Pymt_AMEX				char(1)			= NULL    ,@Pymt_AllCC			char(1)			= NULL    ,@SeniorChildDisc		char(1)			= NULL    ,@ChildDisc				char(1)			= NULL    ,@SeniorDisc			char(1)			= NULL    ,@AAADisc				char(1)			= NULL    ,@AARPDisc				char(1)			= NULL    ,@GovMilitaryDisc		char(1)			= NULL    ,@ChamberofCommerce		char(1)			= NULL    ,@BBB					char(1)			= NULL    ,@OtherAssoc			varchar(50)     = NULL    ,@Open24Hr				char(1)			= NULL    ,@HideHr				char(1)			= NULL    ,@MonOpen				varchar(10)     = NULL    ,@MonClose				varchar(10)     = NULL    ,@TusOpen				varchar(10)     = NULL    ,@TusClose				varchar(10)     = NULL    ,@WedOpen				varchar(10)     = NULL    ,@WedClose	     		varchar(10)     = NULL    ,@ThuOpen				varchar(10)     = NULL    ,@ThuClose				varchar(10)     = NULL    ,@FriOpen				varchar(10)     = NULL    ,@FriClose				varchar(10)     = NULL    ,@SatOpen				varchar(10)     = NULL    ,@SatClose				varchar(10)     = NULL    ,@SunOpen				varchar(10)     = NULL    ,@SunClose				varchar(10)     = NULL    ,@ByAppointment			char(10)		= NULL    ,@Billinginterval		int				= NULL    ,@TitleSearch			varchar(150)    = NULLASSET NOCOUNT ONBEGIN    UPDATE ListingEnhance.dbo.tblTM_UploadLDACImport    SET 				 PartnerID 				= ISNULL(@PartnerID, PartnerID)        ,RLoad 					= 'Y'        ,dtAdd 					= ISNULL(@dtAdd, dtAdd)        ,SiteID 				= ISNULL(@SiteID, SiteID)        ,Distrib 				= ISNULL(@Distrib, Distrib)        ,Reason 				= NULL        ,RID 					= ISNULL(@RID, RID)        ,Ridax 					= ISNULL(@Ridax, Ridax)        ,UserCID 				= ISNULL(@UserCID, UserCID)        ,LeadCID 				= ISNULL(@LeadCID, LeadCID)        ,LeadOrigKey 			= ISNULL(@LeadOrigKey, LeadOrigKey)        ,AgencyLogin 			= ISNULL(@AgencyLogin, AgencyLogin)        ,HideAddress 			= ISNULL(@HideAddress, HideAddress)        ,SalePerson 			= ISNULL(@SalePerson, SalePerson)        ,SalePersonID 			= ISNULL(@SalePersonID, SalePersonID)        ,[Status] 				= ISNULL(@Status, [Status])        ,[Action] 				= ISNULL(@Action, [Action])        ,AdvertiserFirstName 	= ISNULL(@AdvertiserFirstName,AdvertiserFirstName)        ,AdvertiserLastName 	= ISNULL(@AdvertiserLastName, AdvertiserLastName)        ,ContactPhone 			= ISNULL(@ContactPhone, ContactPhone)        ,Email 					= ISNULL(@Email, Email)        ,CompanyID 				= ISNULL(@CompanyID, CompanyID)        ,CompanyName 			= ISNULL(@CompanyName, CompanyName)        ,[Address] 				= ISNULL(@Address, [Address])        ,City 					= ISNULL(@City, City)        ,[State]				= ISNULL(@State, [State])        ,ZipCode 				= ISNULL(@ZipCode, ZipCode)
        ,Phone 					= ISNULL(@Phone, Phone)        ,AltPhone 				= ISNULL(@AltPhone, AltPhone)        ,BusEmail 				= ISNULL(@BusEmail, BusEmail)        ,BDCCategoryID 			= ISNULL(@BDCCategoryID, BDCCategoryID)        ,URL 					= ISNULL(@URL, URL)   
		,DisplayURL 			= ISNULL(@DisplayURL, DisplayURL)        ,ClickURL 				= ISNULL(@ClickURL, ClickURL)        ,Title 					= ISNULL(@Title, Title)        ,TagLine 				= ISNULL(@TagLine, TagLine)        ,[Description] 			= ISNULL(@Description, [Description])        ,LDACDescription 		= ISNULL(@LDACDescription, LDACDescription)        ,BusService 			= ISNULL(@BusService, BusService)        ,Brand 					= ISNULL(@Brand, Brand)        ,BusSpecialty 			= ISNULL(@BusSpecialty, BusSpecialty)        ,BeginSubscription 		= ISNULL(@BeginSubscription, BeginSubscription)        ,EndSubscription 		= ISNULL(@EndSubscription, EndSubscription)        ,Keywords 				= ISNULL(@Keywords, Keywords)        ,KeyCode 				= ISNULL(@KeyCode, KeyCode)        ,BDC1					= ISNULL(@BDC1, BDC1)        ,BDC2 					= ISNULL(@BDC2, BDC2)        ,BDC3 					= ISNULL(@BDC3, BDC3)        ,BDC4 					= ISNULL(@BDC4, BDC4)        ,ServiceCounty 			= ISNULL(@ServiceCounty, ServiceCounty)        ,ServiceCountySt 		= ISNULL(@ServiceCountySt, ServiceCountySt)        ,ServiceCounty2 		= ISNULL(@ServiceCounty2, ServiceCounty2)        ,ServiceCountySt2 		= ISNULL(@ServiceCountySt2, ServiceCountySt2)        ,ServiceCounty3 		= ISNULL(@ServiceCounty3, ServiceCounty3)        ,ServiceCountySt3 		= ISNULL(@ServiceCountySt3, ServiceCountySt3)        ,ServiceCounty4 		= ISNULL(@ServiceCounty4, ServiceCounty4)        ,ServiceCountySt4 		= ISNULL(@ServiceCountySt4, ServiceCountySt4)        ,ServiceCounty5 		= ISNULL(@ServiceCounty5, ServiceCounty5)        ,ServiceCountyST5 		= ISNULL(@ServiceCountyST5, ServiceCountyST5)		,Advertiserid 			= ISNULL(@Advertiserid, Advertiserid)        ,MemberID 				= ISNULL(@MemberID, MemberID)        ,OrderID 				= ISNULL(@OrderID, OrderID)        ,PymTypeID 				= ISNULL(@PymTypeID, PymTypeID)        ,billingMethod 			= ISNULL(@billingMethod, billingMethod)        ,Source 				= ISNULL(@Source, Source)        ,AdCost 				= ISNULL(@AdCost, AdCost)        ,CCLast4 				= ISNULL(@CCLast4, CCLast4)		,MktCode 				= ISNULL(@MktCode, MktCode)        ,DispCode 				= ISNULL(@DispCode, DispCode)        ,Listingid 			= ISNULL(@Listingid, Listingid)        ,UpdatedBy 				= ISNULL(@UpdatedBy, UpdatedBy)        ,YearEst 				= ISNULL(@YearEst, YearEst)        ,NumEmployee 			= ISNULL(@NumEmployee, NumEmployee)        ,NumLocation 			= ISNULL(@NumLocation, NumLocation)        ,BusProduct 			= ISNULL(@BusProduct, BusProduct)        ,Language1 				= ISNULL(@Language1, Language1)        ,LanguageID1			= ISNULL(@LanguageID1, LanguageID1)        ,Language2 				= ISNULL(@Language2, Language2)        ,LanguageID2 			= ISNULL(@LanguageID2, LanguageID2)        ,Language3 				= ISNULL(@Language3, Language3)        ,LanguageID3 			= ISNULL(@LanguageID3, LanguageID3)        ,URLSpecial1 			= ISNULL(@URLSpecial1, URLSpecial1)        ,URLSpecial2 			= ISNULL(@URLSpecial2, URLSpecial2)        ,Pymt_Cash 				= ISNULL(@Pymt_Cash, Pymt_Cash)        ,Pymt_MC 				= ISNULL(@Pymt_MC, Pymt_MC)        ,Pymt_Visa 				= ISNULL(@Pymt_Visa, Pymt_Visa)        ,Pymt_Check 			= ISNULL(@Pymt_Check, Pymt_Check)        ,Pymt_Discover 			= ISNULL(@Pymt_Discover, Pymt_Discover)        ,Pymt_AMEX 				= ISNULL(@Pymt_AMEX, Pymt_AMEX)        ,Pymt_AllCC 			= ISNULL(@Pymt_AllCC, Pymt_AllCC)        ,SeniorChildDisc 		= ISNULL(@SeniorChildDisc, SeniorChildDisc)        ,ChildDisc 				= ISNULL(@ChildDisc, ChildDisc)        ,SeniorDisc 			= ISNULL(@SeniorDisc, SeniorDisc)        ,AAADisc 				= ISNULL(@AAADisc, AAADisc)		,AARPDisc 				= ISNULL(@AARPDisc, AARPDisc)        ,GovMilitaryDisc 		= ISNULL(@GovMilitaryDisc, GovMilitaryDisc)        ,ChamberofCommerce 		= ISNULL(@ChamberofCommerce, ChamberofCommerce)        ,BBB 					= ISNULL(@BBB, BBB)        ,OtherAssoc				= ISNULL(@OtherAssoc, OtherAssoc)        ,Open24Hr 				= ISNULL(@Open24Hr, Open24Hr)        ,HideHr 				= ISNULL(@HideHr, HideHr)        ,MonOpen 				= ISNULL(@MonOpen, MonOpen)        ,MonClose 				= ISNULL(@MonClose, MonClose)        ,TusOpen				= ISNULL(@TusOpen, TusOpen)        ,TusClose 				= ISNULL(@TusClose, TusClose)        ,WedOpen 				= ISNULL(@WedOpen, WedOpen)        ,WedClose 				= ISNULL(@WedClose, WedClose)        ,ThuOpen 				= ISNULL(@ThuOpen, ThuOpen)        ,ThuClose 				= ISNULL(@ThuClose, ThuClose)        ,FriOpen 				= ISNULL(@FriOpen, FriOpen)        ,FriClose 				= ISNULL(@FriClose, FriClose)        ,SatOpen 				= ISNULL(@SatOpen, SatOpen)        ,SatClose 				= ISNULL(@SatClose, SatClose)        ,SunOpen 				= ISNULL(@SunOpen, SunOpen)        ,SunClose 				= ISNULL(@SunClose, SunClose)        ,ByAppointment 			= ISNULL(@ByAppointment, ByAppointment)        ,BillingInterval 		= ISNULL(@BillingInterval, BillingInterval)        ,TitleSearch 			= ISNULL(@TitleSearch, TitleSearch)
        	WHERE [TableKey] = @TableKeyIF @@ERROR = 0SELECT @TableKey AS TableKeyEND

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [web_user]
GO
