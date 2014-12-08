SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Search_Partner]
@lMemberID		int			 = NULL,
@szPartnerName	Varchar(50)  = NULL,
@sContactPhone	Varchar(10)  = NULL,
@szPartnerEmail	Varchar(100) = NULL,
@sActive		char(1)		 = null,

@operation		varchar(10)	= 'exact',	-- Search Methods: 'exact', 'startwith', 'like'  
@sort			varchar(100)= NULL,		-- Column to sort on  
@direction		varchar(5)  = 'asc'		-- Sort order  
--, @group varchar(100) = NULL			-- Column to group on 
AS 
SET NOCOUNT ON 

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
DECLARE   
@sql		varchar(8000),		-- Dynamic t-sql statement  
--@security	int,				-- Member Security Level  
@orderby	varchar(100)		-- Compound Order By clause  
SELECT @orderby = ''

SELECT @sql = '
SELECT  DISTINCT
		 p.lPartnerID
		,p.szPartnerName	
		,p.sContactPhone
		,p.szPartnerEmail
		,p.szSSURL
		,p.szWebSite
		,p.sActive
		,url.szSiteDirectoryURL
FROM tblLP_Partner				p
JOIN tblLP_PartnerSite			s	ON s.lPartnerID = p.lPartnerID
JOIN tblLP_PartnerSiteMember	        m	ON m.lSiteID = s.lSiteID
LEFT JOIN tblLP_PartnerSiteDirectoryURL   url     ON s.lSiteID = url.lSiteID
WHERE 1 = 1 AND s.sSiteType = ''PT''' 

IF @lMemberID IS NOT NULL
BEGIN  
	SELECT @sql = @sql + ' AND m.lMemberID			= ('''+convert(Varchar(25), @lMemberID) +''') ' 
END

IF @operation = 'exact'  
BEGIN   

	IF @szPartnerName IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szPartnerName	= ('''+@szPartnerName+''') '  
	IF @sContactPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND p.sContactPhone	= ('''+@sContactPhone+''') '  
	IF @szPartnerEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szPartnerEmail	= ('''+@szPartnerEmail+''') ' 
END

IF @operation = 'startwith'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column Like ('+@column+'%)'  
*/  

BEGIN    
	IF @szPartnerName IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szPartnerName	LIKE ('''+@szPartnerName+'%'') '  
	IF @sContactPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND p.sContactPhone	LIKE ('''+@sContactPhone+'%'') ' 
	IF @szPartnerEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szPartnerEmail	LIKE ('''+@szPartnerEmail+'%'') ' 
END
 
IF @operation = 'like'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column LIKE (%'+@column+'%)'  
*/  
BEGIN   

	IF @szPartnerName IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szPartnerName	LIKE (''%'+@szPartnerName+'%'') '  
	IF @sContactPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND p.sContactPhone	LIKE (''%'+@sContactPhone+'%'') ' 
	IF @szPartnerEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szPartnerEmail	LIKE (''%'+@szPartnerEmail+'%'') ' 
 
END
IF @sActive IS NOT NULL
SELECT @sql = @sql + ' AND p.sActive	= ('''+@sActive+''') '  


IF @sort IS NULL  

SELECT @orderby = ' p.szPartnerName ' /*default*/ + ' asc' 
ELSE  
SELECT @orderby = @Sort + ' ' + @direction  


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
 --PRINT @sql   
EXEC (@sql)
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Partner] TO [web_user]
GO
