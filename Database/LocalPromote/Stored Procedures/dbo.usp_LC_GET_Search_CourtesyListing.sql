SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_LC_GET_Search_CourtesyListing] 
(		
		@logged_in_user_lSiteID		int				= NULL,
		@Title			varchar(255) = NULL,
		@Address		varchar(255) = NULL,
		@City			varchar(255) = NULL,
		@State			varchar(2) = NULL,
		@Phonenumber	varchar(10) = NULL,

		@operation		varchar(10)	= NULL,		-- Search Methods: 'exact', 'startwith', 'like'  
		@sort			varchar(100)= NULL,		-- Column to sort on  
		@direction		varchar(5) = ' asc'  		-- Sort order  
		--, @group  varchar(100) = NULL			-- Column to group on 
) WITH RECOMPILE
AS
-- usp_LC_GET_Search_CourtesyListing @City = 'IRVINE', @operation = 'EXACT'

SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

DECLARE   
		@sql		varchar(8000),     
		@security	int,       
		@orderby	varchar(100),     
		@groupby	varchar (100),
		@currentActiveDB VARCHAR(15)
		
SELECT @currentActiveDB = ActiveDB FROM listingstoreMaster.dbo.acx_ActiveListingStore
    
SELECT @Phonenumber = REPLACE(REPLACE(REPLACE(REPLACE(@Phonenumber,' ',''),'(',''),')',''),'-','')

SELECT @sql = '
SELECT DISTINCT
	 Title		AS szTitle
	,RID	
	,Address	AS szStreetName
	,City		AS szCity
	,State		AS sState
	,ZipCode	AS sPostalCode
	,Phonenumber AS szPhone
,listingDeletionRequested = case when exists (select 1 from LocalPromote.dbo.tblCC_acxListing acx 
												join LocalPromote.dbo.tblCC_acxListingNote acxn 
												on acx.lCCListingID = acxn.lCCListingID 
												join LocalPromote.dbo.tblLP_PartnerSiteMember psm 
												on acxn.szUpdatedby = CONVERT(varchar(25),psm.lMemberID) 
												where psm.lSiteID = '+ CONVERT(varchar(25),@logged_in_user_lSiteID)+'  
												and acx.sConfirm = ''N'' 
												and acx.RID = '+ @currentActiveDB + '..acx_tbl_listing.RID) 
								then ''Y'' 
								else ''N'' end
 
FROM	' + @currentActiveDB + '..acx_tbl_listing
WHERE 1 = 1'


IF @operation = 'exact'  
BEGIN   
	IF @Title IS NOT NULL  
	SELECT @sql = @sql + ' AND Title	= ('''+@Title+''') '  
	IF @Address IS NOT NULL  
	SELECT @sql = @sql + ' AND Address		= ('''+@Address+''') '  
	IF @City IS NOT NULL  
	SELECT @sql = @sql + ' AND City	= ('''+@City+''') '    
	IF @State IS NOT NULL  
	SELECT @sql = @sql + ' AND State	= ('''+@State+''') '  
	IF @Phonenumber IS NOT NULL  
	SELECT @sql = @sql + ' AND Phonenumber		= ('''+@Phonenumber+''') '  
END

IF @operation = 'startwith'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column Like ('+@column+'%)'  
*/  
BEGIN    
	IF @Title IS NOT NULL  
	SELECT @sql = @sql + ' AND Title	LIKE ('''+@Title+'%'') '  
	IF @Address IS NOT NULL  
	SELECT @sql = @sql + ' AND Address		LIKE ('''+@Address+'%'') '  
	IF @City IS NOT NULL  
	SELECT @sql = @sql + ' AND City	LIKE ('''+@City+'%'') '  
	IF @State IS NOT NULL  
	SELECT @sql = @sql + ' AND State	LIKE ('''+@State+'%'') '
	IF @Phonenumber IS NOT NULL  
	SELECT @sql = @sql + ' AND Phonenumber		LIKE ('''+@Phonenumber+'%'') ' 
END

IF @operation = 'like'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column LIKE (%'+@column+'%)'  
*/  
BEGIN   
	IF @Title IS NOT NULL  
	SELECT @sql = @sql + ' AND Title	LIKE (''%'+@Title+'%'') '  
	IF @Address IS NOT NULL  
	SELECT @sql = @sql + ' AND Address		LIKE (''%'+@Address+'%'') '  
	IF @City IS NOT NULL  
	SELECT @sql = @sql + ' AND City	LIKE (''%'+@City+'%'') '     
	IF @State IS NOT NULL  
	SELECT @sql = @sql + ' AND State LIKE (''%'+@State+'%'') '   
	IF @Phonenumber IS NOT NULL  
	SELECT @sql = @sql + ' AND Phonenumber		LIKE (''%'+@Phonenumber+'%'') '  
END
   
IF @sort IS NULL    
 
SELECT @orderby = ' Title' /*default*/ + ' asc'  
 
ELSE  
SELECT @orderby = @Sort + '  ' + @direction  


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--PRINT @sql   
EXEC (@sql);


GO
