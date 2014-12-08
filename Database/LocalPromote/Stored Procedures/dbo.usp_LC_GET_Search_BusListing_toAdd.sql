SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_Search_BusListing_toAdd]  
@lSiteID	int			= null,
@szTitle	Varchar(150)= null,  
@Location	Varchar(50) = null,  
@szPhone	Varchar(10) = null,  
@operation  Varchar(10) = 'exact',   -- -exact -startwith -like  
@sort		varchar(100) = NULL,    -- Column to sort on  
@direction	varchar(5) = ' asc'  
as   
SET NOCOUNT ON  
  
SELECT @szPhone = REPLACE(REPLACE(REPLACE(REPLACE(@szPhone,' ',''),'(',''),')',''),'-','')  
IF @lSiteID = ''
SELECT  @lSiteID = NULL  
DECLARE   
@sql varchar(8000),     -- Dynamic t-sql statement  
@security int,      -- Member Security Level  
@orderby varchar(100)    -- Compound Order By clause  
SELECT @sql = '  
SELECT DISTINCT
   m.szFirstName  
 , m.szLastName  
 , b.lAdvertiserID	
 , b.szTitle  
 , b.szStreetName  
 , b.szUnit  
 , b.szCity
 , b.sState
 , b.sPostalCode
 , b.szPhone  
 , s.sStatus
 , s.sLastStatus  
 , m.sActive  
 , b.szEmail  
 , m.sUserType   
FROM dbo.tblLP_BusListing b   
join dbo.tblLP_MemberInfo m				on m.lMemberID = b.lMemberID 
join dbo.tblLP_PartnerListing pl	on pl.lAdvertiserID = b.lAdvertiserID  
join dbo.tblLP_PartnerSite   ps		on ps.lSiteID = pl.lSiteID  
join dbo.tblLP_Partner		 p		on p.lPartnerID = ps.lPartnerID   
join dbo.tblLP_BusListingStatus s		on s.lAdvertiserID = b.lAdvertiserID  
WHERE 1=1 '  
  
IF @operation = 'exact'  
BEGIN  
IF @lSiteID is not null  
SELECT @sql = @sql + '  AND pl.lSiteID = ('''+convert(Varchar(15),@lSiteID)+''') ' 
IF @szTitle is not null  
SELECT @sql = @sql + '  AND b.sztitle = ('''+@szTitle+''') '  
IF @Location is not null  
SELECT @sql = @sql + '  AND (  
        b.szStreetName  = ('''+@Location+''')  
 OR  b.szCity  = ('''+@Location+''')   
 OR  b.szCity  = ('''+@Location+''')  
 OR  b.sPostalCode = ('''+@Location+''')  
                           )'  
IF @szPhone is not null  
SELECT @sql = @sql + ' AND b.szPhone = ('''+@szPhone+''') '  
  
END  
   

IF @operation = 'startwith'  
BEGIN  

IF @lSiteID is not null  
SELECT @sql = @sql + ' AND pl.lSiteID LIKE ('''+convert(Varchar(15),@lSiteID)+'%'') '  
IF @szTitle is not null  
SELECT @sql = @sql + ' AND b.sztitle LIKE ('''+@szTitle+'%'') '  
IF @Location is not null  
SELECT @sql = @sql + ' AND (  
							b.szStreetName LIKE ('''+@Location+'%'')  
							OR  b.szCity  LIKE ('''+@Location+'%'')   
							OR  b.szCity  LIKE ('''+@Location+'%'')  
							OR  b.sPostalCode LIKE ('''+@Location+'%'')  
                           )'  
IF @szPhone is not null  
SELECT @sql = @sql + ' AND b.szPhone LIKE ('''+@szPhone+'%'') '  
  
END  
  
IF @operation = 'like'  
BEGIN  
IF @lSiteID is not null  
SELECT @sql = @sql + ' AND pl.lSiteID LIKE (''%'+convert(Varchar(15),@lSiteID)+'%'') '  
IF @szTitle is not null  
SELECT @sql = @sql + ' AND b.sztitle LIKE (''%'+@szTitle+'%'') '  
IF @Location is not null  
SELECT @sql = @sql + ' AND (  
        b.szStreetName LIKE (''%'+@Location+'%'')  
 OR  b.szCity  LIKE (''%'+@Location+'%'')  
 OR  b.szCity  LIKE (''%'+@Location+'%'')  
 OR  b.sPostalCode LIKE (''%'+@Location+'%'')  
                           )'  
IF @szPhone is not null  
SELECT @sql = @sql + ' AND b.szPhone LIKE (''%'+@szPhone+'%'') '  
  
END  

SELECT @sql = @sql + '   AND s.sLastStatus = ''Y''' + ' 
						 AND s.sStatus <> ''DND'''  + ' 
						 AND s.sStatus <> ''ICP''' + ' 
						 AND s.sStatus <> ''DEL''' + ' 
						 AND s.sStatus <> ''PND''' + ' 
						 AND s.sStatus <> ''DNY'''

IF @sort IS null  
SELECT @orderby = 'szTitle' /*default*/ + ' asc'  
ELSE  
SELECT @orderby = @Sort + ' ' + @direction  
  
 
SELECT @sql = @sql + ' ORDER BY ' + @orderby  
  
--  PRINT @sql   
EXEC (@sql)
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toAdd] TO [web_user]
GO
