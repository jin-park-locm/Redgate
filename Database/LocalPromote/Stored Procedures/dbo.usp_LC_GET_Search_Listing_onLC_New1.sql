SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Search_Listing_onLC_New1]  
  
@lMemberID int = NULL,  -- tblLP_BusListing  
@logged_in_user_lSiteID int = NULL,
@lSiteID   int		   = NULL,   -- tblLP_PartnerSite
@szTitle varchar(150) = NULL,  -- tblLP_BusListing  
@szFirstName varchar(50) = NULL, -- tblLP_MemberInfo  
@szLastName varchar(50) = NULL,  -- tblLP_MemberInfo  
@szLoginName varchar(50) = NULL, -- tblLP_MemberInfo  
@szEmail varchar(250) = NULL,  -- tblLP_BusListing  
@szPhone varchar(12) = NULL,  -- tblLP_BusListing  
@szStreetName varchar(100) = NULL, -- tblLP_BusListing  
@szCity		  varchar(100) = NULL, 
@sState char(2) = NULL,    -- tblLP_BusListing  
@szBillingLast varchar(50) = NULL, -- tblLP_MemberCCInfo  
--@szBillingFirst varchar(50) = NULL, -- tblLP_MemberCCInfo   
@szURL varchar(300) = NULL,   -- tblLP_BusListing  
--@szPartnerName varchar(50) = NULL, -- tblLP_Partner  
--@szSiteName varchar(50) = NULL,  -- tblLP_PartnerSite  
@szSpecialName varchar(60) = NULL, -- tblLP_ProductCampaign  
@szProductName varchar(50) = NULL, -- tblLP_ProductList  
@sSource char(3) = NULL,   --tblLP_BusListing (Telesales Agency)  
@szFullName varchar(50) = NULL,  -- tblLP_SalesPerson  
  
@operation varchar(10) = NULL,   -- Search Methods: 'exact', 'startwith', 'like'  
@active char(1) = NULL,     -- Identify active records  
@sort varchar(100) = NULL,    -- Column to sort on  
@direction varchar(5) = ' asc'  --,   -- Sort order  
--@group varchar(100) = NULL    -- Column to group on  
  
  
as  
DECLARE   
@sql varchar(8000),     -- Dynamic t-sql statement  
@security int,      -- Member Security Level  
@orderby varchar(100),    -- Compound Order By clause  
@groupby varchar (100),    -- Group By Column  
@lPartnerID int

IF @lSiteID = ''
SELECT  @lSiteID = NULL
IF @lSiteID IS NULL SELECT @lSiteID = @logged_in_user_lSiteID
--   pl.lSiteID , -- Added by MU
SELECT @sql = '  
SELECT DISTINCT b.lMemberID,  
  p.lPartnerID,  
  pl.lSiteID ,
  m.szFirstName,  
  m.szLastName,  
-- m.szLoginName,  
  b.szEmail,  
-- b.szURL,  
-- b.sSource,  
-- mcci.szBillingLast,  
-- mcci.szBillingFirst,  
-- pc.szSpecialName,  
-- l.szProductName,  
-- sp.szFullName,  
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
						 and pl.lSiteID = '+CONVERT(varchar(25),@logged_in_user_lSiteID)+' and pl.sListingType = ''PAY'' 
				   then ''Y''
			       when exists (select o.sActive from tblLP_ProductOrder o   where o.lAdvertiserID = pl.lAdvertiserID and o.sActive = ''N'')
						 and pl.lSiteID <> '+CONVERT(varchar(25),@logged_in_user_lSiteID)+' and pl.sListingType = ''PAY'' 
				   then ''N''
				   when (pl.lSiteID <> '+CONVERT(varchar(25),@logged_in_user_lSiteID)+' and pl.sListingType = ''FRE'') then ''N''
				   else ''N''
			   end,
	calculatedListingType = case when exists (select o.sActive from tblLP_ProductOrder o   where o.lAdvertiserID = pl.lAdvertiserID and o.sActive = ''Y'' )
						    and pl.lSiteID = '+CONVERT(varchar(25),@logged_in_user_lSiteID)+ ' then ''Premium''
							else ''Basic'' end,
	isGloballyBasic = case when exists (select 1 from tblLP_ProductOrder o 
										where o.lAdvertiserID = pl.lAdvertiserID ) then ''N''
										else ''Y'' end

  
FROM dbo.tblLP_BusListing b  
join dbo.tblLP_MemberInfo m on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing pl on pl.lAdvertiserID = b.lAdvertiserID  
join dbo.tblLP_PartnerSite   ps on ps.lSiteID = pl.lSiteID  
join dbo.tblLP_Partner    p  on p.lPartnerID = ps.lPartnerID 
--join dbo.tblLP_PartnerSiteMember pm on  pm.lSiteID = ps.lSiteID
join dbo.tblLP_BusListingStatus bs on bs.lAdvertiserID = b.lAdvertiserID 
left join dbo.tblLP_ProductOrder po on po.lAdvertiserID = b.lAdvertiserID  
left join dbo.tblLP_ProductCampaign pc on pc.lCIDNo = po.lCIDNo  '
  
    

SELECT  
		@lPartnerID = p.lPartnerID 
FROM tblLP_Partner					p
JOIN tblLP_PartnerSite				s ON p.lPartnerID = s.lPartnerID 
JOIN tblLP_PartnerSiteMember		m ON m.lSiteID	  = s.lSiteID 
WHERE m.lMemberID = @lMemberID

  
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
  
  
SELECT @security = lSecurityLevelID   
FROM tblLP_MemberSecurity   
WHERE lMemberID = @lMemberID  
  
--IF @security = 3  AND @lPartnerID IS NOT NULL
--BEGIN 
--SELECT @sql = @sql + ' WHERE p.lPartnerID = '+CONVERT(varchar(25), @lPartnerID)+  ''  
----SELECT @sql = @sql + ' AND pm.sSiteType = ''PT'''
--END
--
--ELSE IF @security = 4  and @lSiteID IS NOT NULL
--BEGIN 
----SELECT @sql = @sql + ' WHERE p.lPartnerID = '+CONVERT(varchar(25), @lPartnerID)+  ''  
--SELECT @sql = @sql + ' WHERE    ps.lSiteID = '+CONVERT(varchar(25), @lSiteID)+  ''   
----SELECT @sql = @sql + ' AND  ps.sSiteType = ''PS'''
--END
--ELSE  
SELECT @sql = @sql + ' WHERE 1=1 '  
  
--  
--IF @lSiteID is not null  
--SELECT @sql = @sql + ' and pl.lSiteID = '+convert(Varchar(15),@lSiteID)+''  

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
SELECT @sql = @sql + ' and sLastStatus = ''Y''' + ' and sStatus <> ''DND'''  + ' and sStatus <> ''ICP''' + ' and sStatus <> ''DEL''' + ' and sStatus <> ''PND''' + ' and sStatus <> ''DNY''' 
END
ELSE IF @active = 'N'  
BEGIN
SELECT @sql = @sql + ' and sLastStatus = ''Y''' + ' and sStatus <> ''DND'''  
END


SELECT @sql = @sql + 'and sListingType = case when exists (select 1 from tblLP_ProductOrder o 
															where o.lAdvertiserID = pl.lAdvertiserID AND o.sActive = ''Y'' ) 
												then ''PAY''
												else ''FRE'' 
										end '

IF @sort IS NULL    
SELECT @orderby = ' szTitle' /*default*/ + ' asc'  
IF @sort = 'szStreetName'
SELECT @orderby = ' szStreetName, szCity, sState' + ' ' + @direction
ELSE  
SELECT @orderby = @Sort + ' ' + @direction  
  
/*  
IF @group = null  
SELECT @groupby = 'lMemberID' /*default*/  
ELSE  
SELECT @groupby = @group  
*/  
  
SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--PRINT @sql   
EXEC (@sql)

 -- please add sort by city/state as well if we pass in the sort by szStreetName parameter
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Listing_onLC_New1] TO [web_user]
GO
