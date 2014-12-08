SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LC_GET_Search_Listing_onLC_OLD]  
  
@lMemberID					int				= NULL,		-- tblLP_BusListing  
@logged_in_user_lSiteID		int				= NULL,
@lSiteID					int				= NULL,		-- tblLP_PartnerSite
@szTitle					varchar(150)	= NULL,		-- tblLP_BusListing  
@szFirstName				varchar(50)		= NULL,		-- tblLP_MemberInfo  
@szLastName					varchar(50)		= NULL,		-- tblLP_MemberInfo  
@szLoginName				varchar(50)		= NULL,		-- tblLP_MemberInfo  
@szEmail					varchar(250)	= NULL,		-- tblLP_BusListing  
@szPhone					varchar(12)		= NULL,		-- tblLP_BusListing  
@szStreetName				varchar(100)	= NULL,		-- tblLP_BusListing  
@szCity						varchar(100)	= NULL, 
@sState						char(2)			= NULL,		-- tblLP_BusListing  
@szBillingLast				varchar(50)		= NULL,		-- tblLP_MemberCCInfo  
--@szBillingFirst			varchar(50)		= NULL,		-- tblLP_MemberCCInfo   
@szURL						varchar(300)	= NULL,		-- tblLP_BusListing  
--@szPartnerName			varchar(50)		= NULL,		-- tblLP_Partner  
--@szSiteName				varchar(50)		= NULL,		-- tblLP_PartnerSite  
@szSpecialName				varchar(60)		= NULL,		-- tblLP_ProductCampaign  
@szProductName				varchar(50)		= NULL,		-- tblLP_ProductList  
@sSource					char(3)			= NULL,		--tblLP_BusListing (Telesales Agency)  
@szFullName					varchar(50)		= NULL,		-- tblLP_SalesPerson  
  
@operation					varchar(10)		= NULL,		-- Search Methods: 'exact', 'startwith', 'like'  
@active						char(1)			= NULL,     -- Identify active records  
@sort						varchar(100)	= NULL,		-- Column to sort on  
@direction					varchar(5)		= ' asc'	--,   -- Sort order  
--@group					varchar(100)	= NULL		-- Column to group on  
  
  
as  

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE   
@sql			varchar(max),  -- Dynamic t-sql statement  
@security		int,			-- Member Security Level  
@orderby		varchar(100),   -- Compound Order By clause  
@groupby		varchar (100),  -- Group By Column  
@thePartnerID	int,
@theSiteID		int

CREATE TABLE #Results   (
	[lMemberID]				[int]			NULL,
	[lPartnerID]			[int]			NULL,
	[lSiteID]				[int]			NULL,
	[szFirstName]			[varchar](150)	NULL,
	[szLastName]			[varchar](150)	NULL,
	[szEmail]				[varchar](250)	NULL,
	[szPartnerName]			[varchar](150)	NULL,
	[szSiteName]			[varchar](150)	NULL,
	[lAdvertiserID]			[int]			NULL,
	[szTitle]				[varchar](150)	NULL,
	[szStreetName]			[varchar](150)	NULL,
	[szCity]				[varchar](150)	NULL,
	[sState]				[char](2)		NULL,
	[sPostalCode]			[varchar](10)	NULL,
	[szUnit]				[varchar](25)	NULL,
	[szPhone]				[varchar](12)	NULL,
	[sAgencyID]				[char](2)		NULL,
	[sStatus]				[char](3)		NULL,
	[sActive]				[char](1)		NULL,
	[lProductID]			[int]			NULL,
	[sListingType]			[varchar](3)	NULL,
	[isOwner]				[char](1)	NULL,
	[calculatedListingType] [varchar](7)	NULL,
	[isGloballyBasic]		[char](1)	NULL
) 

IF @lSiteID = ''
SELECT  @lSiteID = NULL
IF @lSiteID IS NULL SELECT @lSiteID = @logged_in_user_lSiteID
 
SELECT @sql = '  
SELECT DISTINCT b.lMemberID,  
  p.lPartnerID,  
  ps.lSiteID ,
  m.szFirstName,  
  m.szLastName,  
  b.szEmail,  
  p.szPartnerName,  
  ps.szSiteName,  
  b.lAdvertiserID,  
  b.szTitle,  
  b.szStreetName,  
  b.szCity,  
  b.sState,  
  b.sPostalCode,  
  b.szUnit,  
  b.szPhone,  
  b.sAgencyID,  
  bs.sStatus,  
  bs.sActive,
  pc.lProductID,
  pl.sListingType,
	isOwner = case when  exists (select o.sActive from tblLP_ProductOrder o   where o.lAdvertiserID = pl.lAdvertiserID and o.sActive = ''Y'')
					and pl.lSiteID = '+CONVERT(varchar(25),@logged_in_user_lSiteID)+'	 
					and ps.lSiteID = '+CONVERT(varchar(25),@logged_in_user_lSiteID)+' and pl.sListingType = ''PAY'' 
				   then ''Y''
			       when exists (select o.sActive from tblLP_ProductOrder o   where o.lAdvertiserID = pl.lAdvertiserID and o.sActive = ''N'')
						 and ps.lSiteID <> '+CONVERT(varchar(25),@logged_in_user_lSiteID)+' and pl.sListingType = ''PAY'' 
				   then ''N''
				   when (ps.lSiteID <> '+CONVERT(varchar(25),@logged_in_user_lSiteID)+' and pl.sListingType = ''FRE'') then ''N''
				   else ''N''
			   end,
	calculatedListingType = case when exists (select o.sActive from tblLP_ProductOrder o   where o.lAdvertiserID = pl.lAdvertiserID and o.sActive = ''Y'')
						    --and ps.lSiteID = '+CONVERT(varchar(25),@logged_in_user_lSiteID)+ ' 
							--and pc.lSiteID = ps.lSiteID 
							then ''Premium''
							else ''Basic'' end,
	isGloballyBasic = case when exists (select 1 from tblLP_ProductOrder o 
										where o.lAdvertiserID = pl.lAdvertiserID and o.sActive = ''Y'') then ''N''
										else ''Y'' end

FROM dbo.tblLP_BusListing b  
join dbo.tblLP_MemberInfo m on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing pl on pl.lAdvertiserID = b.lAdvertiserID  and pl.sActive = ''Y''  
left join dbo.tblLP_ProductOrder po on po.lAdvertiserID = b.lAdvertiserID  and po.sActive = ''Y''
left join dbo.tblLP_ProductCampaign pc on pc.lCIDNo = po.lCIDNo  
join dbo.tblLP_PartnerSite   ps on (ps.lSiteID = pl.lSiteID AND pl.sListingType = ''FRE'')  or (ps.lSiteID = pc.lSiteID  AND pl.sListingType = ''PAY'')
join dbo.tblLP_Partner    p  on p.lPartnerID = ps.lPartnerID 
join dbo.tblLP_PartnerSiteMember pm on  pm.lSiteID = ps.lSiteID
join dbo.tblLP_BusListingStatus bs on bs.lAdvertiserID = b.lAdvertiserID 
  '
  

IF @szBillingLast is not null  
SELECT @sql = @sql + 'join dbo.tblLP_MemberCCInfo mcci on mcci.lMemberID = b.lMemberID '  
--ELSE IF @szBillingFirst is not null  
--SELECT @sql = @sql + 'join dbo.tblLP_MemberCCInfo mcci on mcci.lMemberID = b.lMemberID '  
ELSE IF @szSpecialName is not null  
SELECT @sql = @sql + 'join dbo.tblLP_ProductCampaign pc on pc.lSiteID = ps.lSiteID '  
ELSE IF @szProductName is not null  
SELECT @sql = @sql + 'join dbo.tblLP_ProductList l on l.lPartnerID = p.lPartnerID '  
ELSE IF @szFullName is not null  
SELECT @sql = @sql + 'join dbo.tblLP_SalesPerson sp on sp.lSalesPersonID = po.lSalesPersonID '  
  
SELECT @sql = @sql + ' WHERE 1=1 '  
 
IF @operation = 'exact'  
BEGIN  

IF @szTitle is not null  
SELECT @sql = @sql + ' and szTitle = ('''+@szTitle+''') '  
IF @szFirstName is not null  
SELECT @sql = @sql + ' and szFirstName = ('''+@szFirstName+''') '  
IF @szLastName is not null  
SELECT @sql = @sql + ' and szLastName = ('''+@szLastName+''') '  
IF @szLoginName is not null  
SELECT @sql = @sql + ' and szLoginName = ('''+@szLoginName+''') '  
IF @szEmail is not null  
SELECT @sql = @sql + ' and szEmail = ('''+@szEmail+''') '  
IF @szPhone is not null  
SELECT @sql = @sql + ' and szPhone = ('''+@szPhone+''') '  
IF @szStreetName is not null  
SELECT @sql = @sql + ' and szStreetName = ('''+@szStreetName+''') '  
IF @sState is not null  
SELECT @sql = @sql + ' and sState = ('''+@sState+''') ' 
IF @szCity is not null  
SELECT @sql = @sql + ' and szCity = ('''+@szCity+''') '  
IF @szBillingLast is not null  
SELECT @sql = @sql + ' and szBillingLast = ('''+@szBillingLast+''') '  
--IF @szBillingFirst is not null  
--SELECT @sql = @sql + ' and szBillingFirst = ('''+@szBillingFirst+''') '  
IF @szURL is not null  
SELECT @sql = @sql + ' and szURL = ('''+@szURL+''') '  
--IF @szPartnerName is not null  
--SELECT @sql = @sql + ' and szPartnerName = ('''+@szPartnerName+''') '  
--IF @szSiteName is not null  
--SELECT @sql = @sql + ' and szSiteName = ('''+@szSiteName+''') '  
IF @szSpecialName is not null  
SELECT @sql = @sql + ' and szSpecialName = ('''+@szSpecialName+''') '  
IF @szProductName is not null  
SELECT @sql = @sql + ' and szProductName = ('''+@szProductName+''') '  
IF @sSource is not null  
SELECT @sql = @sql + ' and sSource = ('''+@sSource+''') '  
IF @szFullName is not null  
SELECT @sql = @sql + ' and szFullName = ('''+@szFullName+''') '  
END  
   
  
IF @operation = 'startwith'  
/*  
IF @column is not null  
SELECT @sql = @sql + ' and column Like ('+@column+'%)'  
*/  

BEGIN   
IF @szTitle is not null  
SELECT @sql = @sql + ' and szTitle LIKE ('''+@szTitle+'%'') '  
IF @szFirstName is not null  
SELECT @sql = @sql + ' and szFirstName LIKE ('''+@szFirstName+'%'') '  
IF @szLastName is not null  
SELECT @sql = @sql + ' and szLastName LIKE ('''+@szLastName+'%'') '  
IF @szLoginName is not null  
SELECT @sql = @sql + ' and szLoginName LIKE ('''+@szLoginName+'%'') '  
IF @szEmail is not null  
SELECT @sql = @sql + ' and szEmail LIKE ('''+@szEmail+'%'') '  
IF @szPhone is not null  
SELECT @sql = @sql + ' and szPhone LIKE ('''+@szPhone+'%'') '  
IF @szStreetName is not null  
SELECT @sql = @sql + ' and szStreetName LIKE ('''+@szStreetName+'%'') '  
IF @szCity is not null  
SELECT @sql = @sql + ' and szCity LIKE ('''+@szCity+'%'') ' 
IF @sState is not null  
SELECT @sql = @sql + ' and sState LIKE ('''+@sState+'%'') '  
IF @szBillingLast is not null  
SELECT @sql = @sql + ' and szBillingLast LIKE ('''+@szBillingLast+'%'') '  
--IF @szBillingFirst is not null  
--SELECT @sql = @sql + ' and szBillingFirst LIKE ('''+@szBillingFirst+'%'') '  
IF @szURL is not null  
SELECT @sql = @sql + ' and szURL LIKE('''+@szURL+'%'') '  
--IF @szPartnerName is not null  
--SELECT @sql = @sql + ' and szPartnerName LIKE ('''+@szPartnerName+'%'') '  
--IF @szSiteName is not null  
--SELECT @sql = @sql + ' and szSiteName LIKE ('''+@szSiteName+'%'') '  
IF @szSpecialName is not null  
SELECT @sql = @sql + ' and szSpecialName LIKE ('''+@szSpecialName+'%'') '  
IF @szProductName is not null  
SELECT @sql = @sql + ' and szProductName LIKE ('''+@szProductName+'%'') '  
IF @sSource is not null  
SELECT @sql = @sql + ' and sSource LIKE ('''+@sSource+'%'') '  
IF @szFullName is not null  
SELECT @sql = @sql + ' and szFullName LIKE ('''+@szFullName+'%'') '  
END  
  
  
IF @operation = 'like'  
/*  
IF @column is not null  
SELECT @sql = @sql + ' and column LIKE (%'+@column+'%)'  
*/   

BEGIN   
IF @szTitle is not null  
SELECT @sql = @sql + ' and szTitle LIKE (''%'+@szTitle+'%'') '  
IF @szFirstName is not null  
SELECT @sql = @sql + ' and szFirstName LIKE (''%'+@szFirstName+'%'') '  
IF @szLastName is not null  
SELECT @sql = @sql + ' and szLastName LIKE (''%'+@szLastName+'%'') '  
IF @szLoginName is not null  
SELECT @sql = @sql + ' and szLoginName LIKE (''%'+@szLoginName+'%'') '  
IF @szEmail is not null  
SELECT @sql = @sql + ' and szEmail LIKE (''%'+@szEmail+'%'') '  
IF @szPhone is not null  
SELECT @sql = @sql + ' and szPhone LIKE (''%'+@szPhone+'%'') '  
IF @szStreetName is not null  
SELECT @sql = @sql + ' and szStreetName LIKE (''%'+@szStreetName+'%'') '  
IF @szCity is not null  
SELECT @sql = @sql + ' and szCity LIKE (''%'+@szCity+'%'') '  
IF @sState is not null  
SELECT @sql = @sql + ' and sState LIKE (''%'+@sState+'%'') '  
IF @szBillingLast is not null  
SELECT @sql = @sql + ' and szBillingLast LIKE (''%'+@szBillingLast+'%'') '  
--IF @szBillingFirst is not null  
--SELECT @sql = @sql + ' and szBillingFirst LIKE (''%'+@szBillingFirst+'%'') '  
IF @szURL is not null  
SELECT @sql = @sql + ' and szURL LIKE(''%'+@szURL+'%'') '  
--IF @szPartnerName is not null  
--SELECT @sql = @sql + ' and szPartnerName LIKE (''%'+@szPartnerName+'%'') '  
--IF @szSiteName is not null  
--SELECT @sql = @sql + ' and szSiteName LIKE (''%'+@szSiteName+'%'') '  
IF @szSpecialName is not null  
SELECT @sql = @sql + ' and szSpecialName LIKE (''%'+@szSpecialName+'%'') '  
IF @szProductName is not null  
SELECT @sql = @sql + ' and szProductName LIKE (''%'+@szProductName+'%'') '  
IF @sSource is not null  
SELECT @sql = @sql + ' and sSource LIKE (''%'+@sSource+'%'') '  
IF @szFullName is not null  
SELECT @sql = @sql + ' and szFullName LIKE (''%'+@szFullName+'%'') '  
END  
  
  
IF @active = 'Y'  
BEGIN  
SELECT @sql = @sql + ' and sLastStatus = ''Y''' + ' and sStatus <> ''DND'''  + ' and sStatus <> ''ICP''' + ' and sStatus <> ''DEL''' + ' and sStatus <> ''PND''' + ' and sStatus <> ''DNY''' + ' and sStatus <> ''OUT''' 
END
ELSE IF @active = 'N'  
BEGIN
SELECT @sql = @sql + ' and sLastStatus = ''Y''' + ' and sStatus <> ''DND'''  
END


--SELECT @sql = @sql + 'and sListingType = case when exists (select 1 from tblLP_ProductOrder o 
--															where o.lAdvertiserID = pl.lAdvertiserID AND o.sActive = ''Y'' ) 
--												then ''PAY''
--												else ''FRE'' 
--										end '

 
IF @sort IS NULL    
SELECT @orderby = ' szTitle' /*default*/ + ' asc , lAdvertiserID, lMemberID DESC  '  
IF @sort = 'szStreetName'
SELECT @orderby = ' szStreetName'+ ' ' + @direction+', szCity '+' ' + @direction+', sState' + ' ' + @direction +' , lAdvertiserID, lMemberID DESC  '
ELSE  
BEGIN 
IF (@Sort <> 'lAdvertiserID') OR  (@Sort <> 'lMemberID' )
SELECT @orderby = @Sort + ' ' + @direction  +' , lAdvertiserID, lMemberID DESC  '
END
 
   
IF  (@Sort = 'lAdvertiserID') OR  (@Sort = 'lMemberID' )
SELECT @orderby = '  lAdvertiserID, lMemberID DESC  '   
 
--SELECT @sql = @sql + ' ORDER BY ' + @orderby  
 --	 PRINT @sql    
 

INSERT INTO #Results
EXEC (@sql)

SELECT @security = lSecurityLevelID  
--select * 
FROM tblLP_MemberSecurity  -- where lSecurityLevelID = 2
WHERE lMemberID = @lMemberID  
--SELECT @security
 
IF @security = 2 OR @security = 5 or @security = 6 or @security = 7
BEGIN

select @sql ='
	SELECT 
		  [lMemberID]
		, [lPartnerID]
		, [lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, [szPartnerName]	
		, [szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, [sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, [lProductID]	
		, [sListingType]	
		, [isOwner]		
		, [calculatedListingType] 
		, [isGloballyBasic]	
	 FROM #Results 
	UNION ALL
	SELECT  	 
		  NULL	--[lMemberID]
		, NULL	--[lPartnerID]
		, NULL	--[lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, NULL	--[szPartnerName]	
		, NULL	--[szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, NULL	--[sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, NULL	--[lProductID]	
		, ''FRE''
		, NULL	--[isOwner]		
		, ''Basic''  --[calculatedListingType] 
		, [isGloballyBasic] --''N''		
	FROM #Results
	WHERE [calculatedListingType] = ''Premium''
	GROUP BY   [szFirstName] , [szLastName]	, [szEmail]	, [lAdvertiserID] , [szTitle]		
	, [szStreetName], [szCity]	, [sState], [sPostalCode], [szUnit]	, [szPhone]		
	, [sStatus], [sActive], [isGloballyBasic]	'

	SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--	 --	 PRINT @sql    
	exec(@sql)

END

IF @security = 3 
BEGIN
select @sql = '  
			SELECT distinct
		  [lMemberID]
		, [lPartnerID]
		, [lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, [szPartnerName]	
		, [szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, [sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, [lProductID]	
		, [sListingType]	
		, [isOwner]		
		, [calculatedListingType] = CASE WHEN [lPartnerID] IN
												(	SELECT  pt.lPartnerID 
													FROM tblLP_PartnerSiteMember psm 
													JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
													JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
													WHERE lMemberID = '+CONVERT(varchar(25),@lMemberID)+' 
													AND pt.sActive = ''Y''
												) 
										 THEN [calculatedListingType] ELSE ''Basic'' END

		, [isGloballyBasic]	
	INTO #Results1
	FROM #Results 
	WHERE   [lPartnerID] IN
						(	SELECT  pt.lPartnerID 
							FROM tblLP_PartnerSiteMember psm 
							JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
							JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
							WHERE lMemberID = '+CONVERT(varchar(25),@lMemberID)+' 
							AND pt.sActive = ''Y''
						)  
	SELECT distinct
		  [lMemberID]
		, [lPartnerID]
		, [lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, [szPartnerName]	
		, [szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, [sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, [lProductID]	
		, [sListingType]	
		, [isOwner]		
		, [calculatedListingType] 
		, [isGloballyBasic]
	FROM #Results1
	UNION ALL
	SELECT  DISTINCT  
		  NULL	--[lMemberID]
		, NULL	--[lPartnerID]
		, NULL	--[lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, NULL	--[szPartnerName]	
		, NULL	--[szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, NULL	--[sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, NULL	--[lProductID]	
		, ''FRE''	
		, NULL	--[isOwner]		
		, ''Basic''  --[calculatedListingType] 
		, [isGloballyBasic] --''N''	
	FROM #Results 
	WHERE [calculatedListingType] = ''Premium''
	AND    [lPartnerID] IN
						(	SELECT  pt.lPartnerID 
							FROM tblLP_PartnerSiteMember psm 
							JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
							JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
							WHERE lMemberID = '+CONVERT(varchar(25),@lMemberID)+' 
							AND pt.sActive = ''Y''
						)  
	GROUP BY   [szFirstName] , [szLastName]	, [szEmail]	, [lAdvertiserID] , [szTitle]		
	, [szStreetName], [szCity]	, [sState], [sPostalCode], [szUnit]	, [szPhone]		
	, [sStatus], [sActive]	, [isGloballyBasic]

	UNION ALL

	SELECT  DISTINCT 
		  NULL	--[lMemberID]
		, NULL	--[lPartnerID]
		, NULL	--[lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, NULL	--[szPartnerName]	
		, NULL	--[szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, NULL	--[sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, NULL	--[lProductID]	
		, ''FRE''	
		, NULL	--[isOwner]		
		, ''Basic''  --[calculatedListingType] 
		, [isGloballyBasic] --''N''
	FROM #Results  WHERE [lAdvertiserID] NOT IN (SELECT [lAdvertiserID] FROM #Results1)
'

	SELECT @sql = @sql + ' ORDER BY ' + @orderby  
	  --	 PRINT @sql    
	EXEC (@sql)	 
END

IF @security = 4 
BEGIN
select @sql = '  
			SELECT distinct
		  [lMemberID]
		, [lPartnerID]
		, [lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, [szPartnerName]	
		, [szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, [sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, [lProductID]	
		, [sListingType]	
		, [isOwner]		
		, [calculatedListingType] = CASE WHEN [lSiteID] IN 
											(	SELECT  ps.lSiteID 
												FROM tblLP_PartnerSiteMember psm 
												JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
												JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
												WHERE lMemberID = '+CONVERT(varchar(25),@lMemberID)+' 
												AND ps.sActive = ''Y''
											) 
										 THEN [calculatedListingType] ELSE ''Basic'' END

		, [isGloballyBasic]	
	INTO #Results1
	FROM #Results 
	WHERE   [lSiteID] IN 
						(	SELECT  ps.lSiteID 
							FROM tblLP_PartnerSiteMember psm 
							JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
							JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
							WHERE lMemberID = '+CONVERT(varchar(25),@lMemberID)+' 
							AND ps.sActive = ''Y''
						)  
	SELECT distinct
		  [lMemberID]
		, [lPartnerID]
		, [lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, [szPartnerName]	
		, [szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, [sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, [lProductID]	
		, [sListingType]	
		, [isOwner]		
		, [calculatedListingType] 
		, [isGloballyBasic]
	FROM #Results1

	UNION ALL

	SELECT  DISTINCT 
		  NULL	--[lMemberID]
		, NULL	--[lPartnerID]
		, NULL	--[lSiteID]
		, [szFirstName]
		, [szLastName]	
		, [szEmail]		
		, NULL	--[szPartnerName]	
		, NULL	--[szSiteName]	
		, [lAdvertiserID]	
		, [szTitle]		
		, [szStreetName]	
		, [szCity]		
		, [sState]		
		, [sPostalCode]	
		, [szUnit]		
		, [szPhone]		
		, NULL	--[sAgencyID]		
		, [sStatus]		
		, [sActive]		
		, NULL	--[lProductID]	
		, ''FRE''	
		, NULL	--[isOwner]		
		, ''Basic''  --[calculatedListingType] 
		, [isGloballyBasic] --''N''
	FROM #Results  WHERE [lAdvertiserID] NOT IN (SELECT [lAdvertiserID] FROM #Results1)
'


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
 --	 PRINT @sql 
exec ( @sql   )

END






GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_OLD] TO [web_user]
GO
