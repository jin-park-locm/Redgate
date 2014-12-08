SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_Search_BusListing_toEdit]  
@szTitle  Varchar(150),  
@Location  Varchar(50) = null,  
@szPhone  Varchar(10) = null,  
@operation  Varchar(10),   -- -exact -startwith -like  
@sort varchar(100) = NULL,    -- Column to sort on  
@direction varchar(5) = ' asc'  
as  
   
SET NOCOUNT ON  
  
SELECT @szPhone = REPLACE(REPLACE(REPLACE(REPLACE(@szPhone,' ',''),'(',''),')',''),'-','')  
  
DECLARE   
@sql varchar(8000),     -- Dynamic t-sql statement  
@security int,      -- Member Security Level  
@orderby varchar(100)    -- Compound Order By clause

SELECT @sql = '  
SELECT  DISTINCT
   m.szFirstName  
 , m.szLastName  
 , b.RIDAX as ListingID    
 , b.szTitle  
 , b.szStreetName  
 , b.szUnit  
 , b.szCity
 , b.sState
 , b.szPhone  
 , s.sStatus  
 , m.sActive  
 , b.szEmail  
 , m.sUserType 
 , ps.lPartnerID
 , ps.lSiteID  
FROM tblLP_BusListing b   
join tblLP_MemberInfo m   on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing pl	on pl.lAdvertiserID = b.lAdvertiserID  
join tblLP_BusListingStatus s on s.lAdvertiserID = b.lAdvertiserID  
join tblLP_PartnerSite	   ps on ps.lSiteID = pl.lSiteID 
WHERE 1=1 '  
  
 
IF @operation = 'exact'  
BEGIN  
  
IF @szTitle is not null  
SELECT @sql = @sql + 'and b.sztitle = ('''+@szTitle+''') '  
IF @Location is not null  
SELECT @sql = @sql + 'and (  
        b.szStreetName  = ('''+@Location+''')  
 OR  b.szCity  = ('''+@Location+''')   
 OR  b.szCity  = ('''+@Location+''')  
 OR  b.sPostalCode = ('''+@Location+''')  
                           )'  
IF @szPhone is not null  
SELECT @sql = @sql + 'and b.szPhone = ('''+@szPhone+''') '  
  
END  
  
IF @operation = 'startwith'  
BEGIN  
  
IF @szTitle is not null  
SELECT @sql = @sql + 'and b.sztitle LIKE ('''+@szTitle+'%'') '  
IF @Location is not null  
SELECT @sql = @sql + 'and (  
        b.szStreetName LIKE ('''+@Location+'%'')  
 OR  b.szCity  LIKE ('''+@Location+'%'')   
 OR  b.szCity  LIKE ('''+@Location+'%'')  
 OR  b.sPostalCode LIKE ('''+@Location+'%'')  
                           )'  
IF @szPhone is not null  
SELECT @sql = @sql + 'and b.szPhone LIKE ('''+@szPhone+'%'') '  
  
END  
  
IF @operation = 'like'  
BEGIN  
  
IF @szTitle is not null  
SELECT @sql = @sql + 'and b.sztitle LIKE (''%'+@szTitle+'%'') '  
IF @Location is not null  
SELECT @sql = @sql + 'and (  
        b.szStreetName LIKE (''%'+@Location+'%'')  
 OR  b.szCity  LIKE (''%'+@Location+'%'')  
 OR  b.szCity  LIKE (''%'+@Location+'%'')  
 OR  b.sPostalCode LIKE (''%'+@Location+'%'')  
                           )'  
IF @szPhone is not null  
SELECT @sql = @sql + 'and b.szPhone LIKE (''%'+@szPhone+'%'') '  
  
END  

SELECT @sql = @sql + '  and s.sLastStatus = ''Y''' + ' 
						and s.sStatus <> ''DND'''  + ' 
						and s.sStatus <> ''ICP''' + ' 
						and s.sStatus <> ''DEL''' + ' 
						and s.sStatus <> ''PND''' + ' 
						and s.sStatus <> ''DNY'''

IF @sort IS null  
SELECT @orderby = 'szTitle' /*default*/ + ' asc'  
ELSE  
SELECT @orderby = @Sort + ' ' + @direction  
  
 
SELECT @sql = @sql + ' ORDER BY ' + @orderby  
  
-- PRINT @sql   
EXEC (@sql)
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_BusListing_toEdit] TO [web_user]
GO
