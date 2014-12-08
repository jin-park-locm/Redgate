SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_BulkUpload_Basic] 
@filepath varchar(255),
@FileMoveTo varchar(255)
AS
/*
EXEC usp_LC_BulkUpload_Basic
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
select @sql = 'MASTER..XP_CMDSHELL "dir/b '+ @filepath+ 'basic*.xls"'

INSERT into  @tempFileName exec (@sql)
delete from @tempFileName where name not like '%.xls'
 
select @maxRowID = (SELECT max(RowId) FROM @tempFileName where name is not null)

IF ISNULL(@maxRowID,0) = 0 begin SELECT 'No Files to Process....' Return end

WHILE @count <= @maxRowID
BEGIN
  select @filename = (SELECT name FROM  @tempFileName   
  WHERE [RowId] = @count)

	BEGIN

				if object_id ('tempdb..#BasicListingUploadTemp') IS NOT NULL
				drop table #BasicListingUploadTemp

				CREATE TABLE #BasicListingUploadTemp
				(
				--[ROWID]						int  identity ,
 
				F1						varchar(255)	NULL,
				[ContactFirstName]		varchar(255)	NULL,
				[ContactLastName]		varchar(255)	NULL,
				[Email]					varchar(255)	NULL,
				[ContactPhone]			varchar(255)	NULL,
				[BusinessName]			varchar(255)	NULL,
				[BusinessAddress1]		varchar(255)	NULL,
				[BusinessAddress2]		varchar(255)	NULL,
				[BusinessCity]			varchar(255)	NULL,
				[BusinessState]			varchar(255)	NULL,
				[BusinessZip]			varchar(255)	NULL,
				[HideAddress]			varchar(255)	NULL,
				[BusinessPhone]			varchar(255)	NULL,
				[BusinessDescription]	varchar(255)	NULL,
				[BusinessEmail]			varchar(255)	NULL,
				[BusinessWebSiteURL]	varchar(255)	NULL,
				[BusinessCategory1]		varchar(255)	NULL,
				[BusinessCategory2]		varchar(255)	NULL,
				[PartnerID]				varchar(255)	NULL,
				[PartnerSiteID]			varchar(255)	NULL

 

				)
				 

				select @sql = '
				select   
				 *  
				FROM OPENROWSET(''Microsoft.Jet.OLEDB.4.0'',
				''Excel 8.0;Database='+@filepath+@fileName+';HDR=NO;IMEX=1'',
				''SELECT * FROM [LPBasicListingUploadTemp$]'')A'

--				select ( @sql)  
				INSERT INTO #BasicListingUploadTemp
				exec( @sql)

				alter table #BasicListingUploadTemp add ROWID int identity

				delete  
				from #BasicListingUploadTemp 
				where ROWID  <=(select rowid+1 from #BasicListingUploadTemp where [ContactFirstName] = 'Contact First Name')
				or   [ContactFirstName] is null 
				  
				 
				--alter table #BasicListingUploadTemp drop column RowID

				--select *   from ListingEnhance..tblTM_UploadLDACImport where [UpdatedBy] = 'PHPBulk'
				 -- ListingEnhance.dbo.sp_help tblTM_UploadLDACImport
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
						[Description],
						[HideAddress],
						[BusEmail],
						[URL],
						[PartnerID],
						[SiteID],
						[Source]

					) 

				select 
				  getdate()
				, 'PHPBulk'
				, Rtrim(Ltrim([ContactFirstName]))
				, Rtrim(Ltrim([ContactLastName]))
				, Rtrim(Ltrim([Email]))
				, Rtrim(Ltrim([ContactPhone]))
				, Rtrim(Ltrim([BusinessName]))
				, Rtrim(Ltrim([BusinessAddress1]))
				, Rtrim(Ltrim([BusinessAddress2]))
				, Rtrim(Ltrim([BusinessCity]))
				, Rtrim(Ltrim([BusinessState]))
				, Rtrim(Ltrim([BusinessZip]))
				, Rtrim(Ltrim([BusinessPhone]))
				, Rtrim(Ltrim([BusinessCategory1]))
				, Rtrim(Ltrim([BusinessCategory2]))
				, Rtrim(Ltrim([BusinessDescription]))
				, Rtrim(Ltrim([HideAddress]))
				, Rtrim(Ltrim([BusinessEmail]))
				, Rtrim(Ltrim([BusinessWebSiteURL]))
				, Rtrim(Ltrim([PartnerID]))
				, Rtrim(Ltrim([PartnerSiteID]))
				, 'FRE'

				from #BasicListingUploadTemp 

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
					ErrorDate		,  
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
select top 10 *  -- delete 
from ListingEnhance..tblTM_UploadLDACImport where [UpdatedBy] = 'PHPBulk' order by [dtAdd] desc
select top 10 * from tblLP_ProcErrorsInfo order by errordate desc

*/
GO
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_BulkUpload_Basic] TO [web_user]
GO
