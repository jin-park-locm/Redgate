SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_BulkUpload_Premium] 
@filepath varchar(255),
@FileMoveTo varchar(255)
AS
/*
EXEC usp_LC_BulkUpload_Premium
				 @filepath = 'c:\temp\BulkUpload\'
				,@FileMoveTo = 'c:\temp\BulkUpload\Processed\'

*/
SET NOCOUNT ON 
BEGIN TRY

Declare @dircmd as varchar(max)
DECLARE @filename varchar(255)
--DECLARE @filepath varchar(255)
--DECLARE @FileMoveTo varchar(255)
DECLARE @maxRowID int
DECLARE @count int
DECLARE @tempFileName table (RowId int identity(1,1), name varchar(100))
Declare @sql as varchar(max)

if right(@filepath,1) <> '\'   select @filepath = @filepath+'\'      

if right(@FileMoveTo,1) <> '\'   select @FileMoveTo = @FileMoveTo+'\'  

select @count =1 
select @sql = 'MASTER..XP_CMDSHELL "dir/b '+ @filepath+ 'premium*.xls"'

INSERT into  @tempFileName exec (@sql)
delete from @tempFileName where name not like '%.xls'
 
select @maxRowID = (SELECT max(RowId) FROM @tempFileName where name is not null)

IF ISNULL(@maxRowID,0) = 0 begin SELECT 'No Files to Process....' Return end

WHILE @count <= @maxRowID
BEGIN
  select @filename = (SELECT name FROM  @tempFileName   
  WHERE [RowId] = @count)

	BEGIN

				if object_id ('tempdb..#PremiumListingUploadTemp') IS NOT NULL
				drop table #PremiumListingUploadTemp

				CREATE TABLE #PremiumListingUploadTemp
				(
				--[ROWID]						int  identity ,
				F1							varchar(255) 	NULL,
				[ContactFirstName]			varchar(255) 	NULL,
				[ContactLastName]			varchar(255) 	NULL,
				[Email]						varchar(255) 	NULL,
				[ContactPhone]				varchar(255) 	NULL,	
				[BusinessName]				varchar(255) 	NULL,
				[BusinessAddress1]			varchar(255) 	NULL,
				[BusinessAddress2]			varchar(255) 	NULL,
				[BusinessCity]				varchar(255) 	NULL,
				[BusinessState]				varchar(255) 	NULL,
				[BusinessZip]				varchar(255) 	NULL,
				[BusinessPhone]				varchar(255) 	NULL,
				[BusinessCategory1]			varchar(255) 	NULL,
				[BusinessCategory2]			varchar(255) 	NULL,
				[BusinessTagLine]			varchar(255) 	NULL,
				[BusinessDescription]		varchar(255) 	NULL,
				[HideAddress]				varchar(255) 	NULL,
				[BusinessEmail]				varchar(255) 	NULL,
				[BusinessWebSiteURL]		varchar(255) 	NULL,
				[BusinessWebSiteDisplayURL]	varchar(255) 	NULL,
				[BusinessService]			varchar(255) 	NULL,
				[BrandsOffered]				varchar(255) 	NULL,
				[CustomKeywords]			varchar(255) 	NULL,
				[ServiceAreaCounty1]		varchar(255) 	NULL,
				[ServiceAreaState1]			varchar(255) 	NULL,
				[ServiceAreaCounty2]		varchar(255) 	NULL,
				[ServiceAreaState2]			varchar(255) 	NULL,
				[ServiceAreaCounty3]		varchar(255) 	NULL,
				[ServiceAreaState3]			varchar(255) 	NULL,
				[ServiceAreaCounty4]		varchar(255) 	NULL,
				[ServiceAreaState4]			varchar(255) 	NULL,
				[ServiceAreaCounty5]		varchar(255) 	NULL,
				[ServiceAreaState5]			varchar(255) 	NULL,
				[YearEstablished]			varchar(255) 	NULL,
				[NumberofEmployees]			varchar(255) 	NULL,
				[NumberofLocations]			varchar(255) 	NULL,
				[ProductsOffered]			varchar(255) 	NULL,
				[SpecialtyProductsServices] varchar(255) 	NULL,
				[LanguageSpoken1]			varchar(255) 	NULL,
				[LanguageSpoken2]			varchar(255) 	NULL,
				[LanguageSpoken3]			varchar(255) 	NULL,
				[SpecialOfferURL1]			varchar(255) 	NULL,
				[SpecialOfferText1]			varchar(255) 	NULL,
				[SpecialOfferURL2]			varchar(255) 	NULL,
				[SpecialOfferText2]			varchar(255) 	NULL,
				[Pymt_Cash]					varchar(255) 	NULL,
				[Pymt_MC]					varchar(255) 	NULL,
				[Pymt_Visa]					varchar(255) 	NULL,
				[Pymt_Check]				varchar(255) 	NULL,
				[Pymt_Discover]				varchar(255) 	NULL,
				[Pymt_AMEX]					varchar(255) 	NULL,
				[Pymt_AllCC]				varchar(255) 	NULL,
				[SeniorChildDiscount]		varchar(255) 	NULL,
				[ChildDiscount]				varchar(255) 	NULL,
				[SeniorDiscount]			varchar(255) 	NULL,
				[AAADiscount]				varchar(255) 	NULL,
				[AARPDiscount]				varchar(255) 	NULL,
				[GovernmentMilitaryDiscount] varchar(255) 	NULL,
				[ChamberofCommerceMember]	varchar(255) 	NULL,
				[BBBMember]					varchar(255) 	NULL,
				[OtherAssociations]			varchar(255) 	NULL,
				[Open24Hr]					varchar(255) 	NULL,
				[HideHr]					varchar(255) 	NULL,
				[MonOpen]					varchar(255) 	NULL,
				[MonClose]					varchar(255) 	NULL,
				[TuesOpen]					varchar(255) 	NULL,
				[TuesClose]					varchar(255) 	NULL,
				[WedOpen]					varchar(255) 	NULL,
				[WedClose]					varchar(255) 	NULL,
				[ThurOpen]					varchar(255) 	NULL,
				[ThurClose]					varchar(255) 	NULL,
				[FriOpen]					varchar(255) 	NULL,
				[FriClose]					varchar(255) 	NULL,
				[SatOpen]					varchar(255) 	NULL,
				[SatClose]					varchar(255) 	NULL,
				[SunOpen]					varchar(255) 	NULL,
				[SunClose]					varchar(255) 	NULL,
				[ByAppointment]				varchar(255) 	NULL,
				[UserCID]					varchar(255) 	NULL,
				[Source]					varchar(255) 	NULL,
				[PartnerID]					varchar(255) 	NULL,
				[PartnerSiteID]				varchar(255) 	NULL,
				[DistributionType]			varchar(255) 	NULL,
				[Disposition]				varchar(255) 	NULL,
				[SalesPersonID]				varchar(255) 	NULL,
				[BillingMethod]				varchar(255) 	NULL,
				[BillingCycle]				varchar(255) 	NULL,
				[StartDate]					varchar(255) 	NULL,
				[EndDate]					varchar(255) 	NULL,
				[BriefBusinessDescription]	varchar(255) 	NULL,
				[SubscriptionCost]			varchar(255) 	NULL,
				[BusinessAlternatePhone]	varchar(255) 	NULL,
				[BusinessCategory3]			varchar(255) 	NULL,
				[BusinessCategory4]			varchar(255) 	NULL,
				[BusinessCategory5]			varchar(255) 	NULL,
				[BusinessCategory6]			varchar(255) 	NULL,
				[CCLast4]					varchar(255) 	NULL,
				[RID]						varchar(255) 	NULL,
				[PymtTypeID]				varchar(255) 	NULL,
				[OrigKey]					varchar(255) 	NULL,
				[CallDate]					varchar(255) 	NULL,
				[LeadCID]					varchar(255) 	NULL,

				)
				 

				select @sql = '
				select   
				 *   
				FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'',
				''Excel 8.0;Database='+@filepath+@fileName+';HDR=NO;IMEX=1'',
				''SELECT * FROM [PremiumListingUploadTemp$]'')A'

--				select ( @sql)  
				INSERT INTO #PremiumListingUploadTemp
				exec( @sql)
 
				alter table #PremiumListingUploadTemp add ROWID int identity

				delete  
				from #PremiumListingUploadTemp 
				where ROWID  <=(select rowid+1 from #PremiumListingUploadTemp where [ContactFirstName] = 'Contact First Name')
				or   [ContactFirstName] is null 
				  
				 
				--alter table #PremiumListingUploadTemp drop column RowID

				--select *   from ListingEnhance..tblTM_UploadLDACImport where [UpdatedBy] = 'PHPBulk'
				 
				INSERT INTO ListingEnhance.dbo.tblTM_UploadLDACImport
					(

						[dtAdd],
						[UpdatedBy],
						[AdvertiserFirstName],
						[AdvertiserLastName],
						[Email],
						[ContactPhone],
						[CompanyName],
						[Address],
						[Address2],
						[City],
						[State],
						[ZipCode],
						[Phone],
						[BDCCategoryID],
						[BDC1],
						[TagLine],
						[Description],
						[LDACDescription],
						[HideAddress],
						[BusEmail],
						[URL],
						[DisplayURL],
						[BusService],
						[Brand],
						[Keywords],
						[ServiceCounty],
						[ServiceCountySt],
						[ServiceCounty2],
						[ServiceCountySt2],
						[ServiceCounty3],
						[ServiceCountySt3],
						[ServiceCounty4],
						[ServiceCountySt4],
						[ServiceCounty5],
						[ServiceCountyST5],
						[YearEst],
						[NumEmployee],
						[NumLocation],
						[BusProduct],
						[BusSpecialty],
						[Language1],
						[Language2],
						[Language3],
						[URLSpecial1],
						[URLSpecialText1],
						[URLSpecial2],
						[URLSpecialText2],
						[Pymt_Cash],
						[Pymt_MC],
						[Pymt_Visa],
						[Pymt_Check],
						[Pymt_Discover],
						[Pymt_AMEX],
						[Pymt_AllCC],
						[SeniorChildDisc],
						[ChildDisc],
						[SeniorDisc],
						[AAADisc],
						[AARPDisc],
						[GovMilitaryDisc],
						[ChamberofCommerce],
						[BBB],
						[OtherAssoc],
						[Open24Hr],
						[HideHr],
						[MonOpen],
						[MonClose],
						[TusOpen],
						[TusClose],
						[WedOpen],
						[WedClose],
						[ThuOpen],
						[ThuClose],
						[FriOpen],
						[FriClose],
						[SatOpen],
						[SatClose],
						[SunOpen],
						[SunClose],
						[ByAppointment],
						[UserCID],
						[Source],
						[PartnerID],
						[SiteID],
						[Distrib],
						[DispCode],
						[PymTypeID],
						[SalePersonID],
						[BeginSubscription],
						[EndSubscription],
						[AdCost],
						[AltPhone],
						[BDC2],
						[BDC3],
						[BDC4],
						[BDC5],
						[RID],
						[LeadOrigKey],
						[dtCalled],
						[LeadCID],
						[BillingInterval],
						[CCLast4],
						[billingMethod]
					) 

				select 
				  getdate()
				, 'PHPBulk'
				, Rtrim(Ltrim(ContactFirstName))
				, Rtrim(Ltrim(ContactLastName))
				, Rtrim(Ltrim(Email))
				, Rtrim(Ltrim(ContactPhone))
				, Rtrim(Ltrim(BusinessName))
				, Rtrim(Ltrim(BusinessAddress1))
				, Rtrim(Ltrim(BusinessAddress2))
				, Rtrim(Ltrim(BusinessCity))
				, Rtrim(Ltrim(BusinessState))
				, Rtrim(Ltrim(BusinessZip))
				, Rtrim(Ltrim(BusinessPhone))
				, Rtrim(Ltrim(BusinessCategory1))
				, Rtrim(Ltrim(BusinessCategory2))
				, Rtrim(Ltrim(BusinessTagLine))
				, Rtrim(Ltrim(BusinessDescription))
				, Rtrim(Ltrim(BriefBusinessDescription))
				, Rtrim(Ltrim(ISNULL(HideAddress, 'N')))
				, Rtrim(Ltrim(BusinessEmail))
				, Rtrim(Ltrim(BusinessWebSiteURL))
				, Rtrim(Ltrim(BusinessWebSiteDisplayURL))
				, Rtrim(Ltrim(BusinessService))
				, Rtrim(Ltrim(BrandsOffered))
				, Rtrim(Ltrim(CustomKeywords))
				, Rtrim(Ltrim(ServiceAreaCounty1))
				, Rtrim(Ltrim(ServiceAreaState1))
				, Rtrim(Ltrim(ServiceAreaCounty2))
				, Rtrim(Ltrim(ServiceAreaState2))
				, Rtrim(Ltrim(ServiceAreaCounty3))
				, Rtrim(Ltrim(ServiceAreaState3))
				, Rtrim(Ltrim(ServiceAreaCounty4))
				, Rtrim(Ltrim(ServiceAreaState4))
				, Rtrim(Ltrim(ServiceAreaCounty5))
				, Rtrim(Ltrim(ServiceAreaState5))
				, Rtrim(Ltrim(YearEstablished))
				, Rtrim(Ltrim(NumberofEmployees))
				, Rtrim(Ltrim(NumberofLocations))
				, Rtrim(Ltrim(ProductsOffered))
				, Rtrim(Ltrim(SpecialtyProductsServices))
				, Rtrim(Ltrim(LanguageSpoken1))
				, Rtrim(Ltrim(LanguageSpoken2))
				, Rtrim(Ltrim(LanguageSpoken3))
				, Rtrim(Ltrim(SpecialOfferURL1))
				, Rtrim(Ltrim(SpecialOfferText1))
				, Rtrim(Ltrim(SpecialOfferURL2))
				, Rtrim(Ltrim(SpecialOfferText2))
				, Rtrim(Ltrim(Pymt_Cash))
				, Rtrim(Ltrim(Pymt_MC))
				, Rtrim(Ltrim(Pymt_Visa))
				, Rtrim(Ltrim(Pymt_Check))
				, Rtrim(Ltrim(Pymt_Discover))
				, Rtrim(Ltrim(Pymt_AMEX))
				, Rtrim(Ltrim(Pymt_AllCC))
				, Rtrim(Ltrim(SeniorChildDiscount))
				, Rtrim(Ltrim(ChildDiscount))
				, Rtrim(Ltrim(SeniorDiscount))
				, Rtrim(Ltrim(AAADiscount))
				, Rtrim(Ltrim(AARPDiscount))
				, Rtrim(Ltrim(GovernmentMilitaryDiscount))
				, Rtrim(Ltrim(ChamberofCommerceMember))
				, Rtrim(Ltrim(BBBMember))
				, Rtrim(Ltrim(OtherAssociations))
				, Rtrim(Ltrim(Open24Hr))
				, Rtrim(Ltrim(HideHr))
				, Rtrim(Ltrim(MonOpen))
				, Rtrim(Ltrim(MonClose))
				, Rtrim(Ltrim(TuesOpen))
				, Rtrim(Ltrim(TuesClose))
				, Rtrim(Ltrim(WedOpen))
				, Rtrim(Ltrim(WedClose))
				, Rtrim(Ltrim(ThurOpen))
				, Rtrim(Ltrim(ThurClose))
				, Rtrim(Ltrim(FriOpen))
				, Rtrim(Ltrim(FriClose))
				, Rtrim(Ltrim(SatOpen))
				, Rtrim(Ltrim(SatClose))
				, Rtrim(Ltrim(SunOpen))
				, Rtrim(Ltrim(SunClose))
				, Rtrim(Ltrim(ByAppointment))
				, Rtrim(Ltrim(UserCID))
				, Rtrim(Ltrim(Source))
				, Rtrim(Ltrim(PartnerID))
				, Rtrim(Ltrim(PartnerSiteID))
				, Rtrim(Ltrim(DistributionType))
				, Rtrim(Ltrim(Disposition))
				, Rtrim(Ltrim(PymtTypeID))
				, Rtrim(Ltrim(SalesPersonID))
				,  StartDate
				,  EndDate
				,  SubscriptionCost
				, Rtrim(Ltrim(BusinessAlternatePhone))
				, Rtrim(Ltrim(BusinessCategory3))
				, Rtrim(Ltrim(BusinessCategory4))
				, Rtrim(Ltrim(BusinessCategory5))
				, Rtrim(Ltrim(BusinessCategory6))
				, Rtrim(Ltrim(RID))
				, Rtrim(Ltrim(OrigKey))
				, Rtrim(Ltrim(CallDate))
				, Rtrim(Ltrim(LeadCID))
				, Rtrim(Ltrim(BillingCycle))
				, Rtrim(Ltrim(CCLast4))
				, Rtrim(Ltrim(BillingMethod))

				from #PremiumListingUploadTemp 


	END
		select @sql = 'exec xp_cmdshell ''move "'+@filepath+@filename+ '" "'+@FileMoveTo +'" '''
--		select @sql
		exec (@sql)
		select  @filename=' ' 
        select  @count = @count + 1                                  
END

END TRY

BEGIN CATCH

				INSERT INTO tblLP_ProcErrorsInfo 
				(	    
					ErrorDate		 ,  
					ErrorNumber		 ,     
					ErrorSeverity	 ,
					ErrorState		 , 
					ErrorProcedure	 ,
					ErrorLine		 ,      
					ErrorMessage	 ,      
					DatabaseName	 ,
					OtherInfo		  
				)
				SELECT
				Getdate()			AS ErrorDate,
				ERROR_NUMBER()		AS ErrorNumber,
				ERROR_SEVERITY()	AS ErrorSeverity,
				ERROR_STATE()		AS ErrorState,
				ERROR_PROCEDURE()	AS ErrorProcedure,
				ERROR_LINE()		AS ErrorLine,
				ERROR_MESSAGE()		AS ErrorMessage,
				DB_NAME()			AS DatabaseName,
				@filepath+@filename AS FileInfo

		select @sql = 'exec xp_cmdshell ''move "'+@filepath+@filename+ '" "'+@FileMoveTo +'Error-'+@filename+'"'''
--		select @sql
		exec (@sql)

END CATCH

/*
select *  -- delete 
from ListingEnhance..tblTM_UploadLDACImport where [UpdatedBy] = 'PHPBulk'
order by dtadd desc

select * from tblLP_ProcErrorsInfo
ALTER TABLE tblLP_ProcErrorsInfo
(      
    ErrorLogID		int identity(1,1) primary key,      
    ErrorDate		datetime default(GETDATE()),  
    ErrorNumber		int,     
    ErrorSeverity	int,
    ErrorState		int, 
    ErrorProcedure	varchar(100),
    ErrorLine		int,      
    ErrorMessage	nvarchar(max),      
    DatabaseName	varchar(100) ,
	OtherInfo		varchar(255)   
)

*/
GO
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Premium] TO [web_user]
GO
