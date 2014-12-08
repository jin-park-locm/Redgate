SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Search_AdminUser_to_Manage]
@lMemberID		int			= NULL,
@logged_in_lMemberID int    = NULL,
@szLoginEmail	varchar(150) = NULL,
@szLastName		Varchar(50) = null,
--@szFirstName	Varchar(50) = null,
@szLoginName	Varchar(50) = null,
@active		char(1) = null,
@operation		varchar(10)	= NULL,		-- Search Methods: 'exact', 'startwith', 'like'  
@sort			varchar(100)= NULL,		-- Column to sort on  
@direction		varchar(5) = ' asc',  		-- Sort order  
--, @group varchar(100) = NULL			-- Column to group on 
@lSiteID int = NULL, -- mod by Linh
@lPartnerID int = NULL -- mod by Linh
as
-- [usp_LC_GET_Search_AdminUser_to_Manage] @logged_in_lMemberID = 1425, @lMemberID = 1425, @sActive = 'Y'
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
DECLARE   
@sql		varchar(8000),		-- Dynamic t-sql statement  
@security	int,				-- Member Security Level  
@orderby	varchar(100)		-- Compound Order By clause  
DECLARE @thePartnerID int ,
		@theSiteID	  int

IF @logged_in_lMemberID IS NOT NULL
SELECT @security = lSecurityLevelID   
FROM tblLP_MemberSecurity   
WHERE lMemberID = @logged_in_lMemberID  
--  select * from tblAL_SecurityLevel

-- Mod by Linh
-- Find the partner based on lMemberID
IF @security = 3 
	BEGIN
	SELECT @thePartnerID = pt.lPartnerID 
	FROM tblLP_PartnerSiteMember psm 
	JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
	JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
	WHERE lMemberID = @logged_in_lMemberID
		AND pt.sActive = 'Y'
	SELECT @lPartnerID = @thePartnerID
	END
-- end of Find partner

-- Find the partnersite based on lMemberID
IF @security = 4 
	BEGIN
	SELECT @theSiteID = ps.lSiteID 
	FROM tblLP_PartnerSiteMember psm 
	JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
	JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
	WHERE lMemberID = @logged_in_lMemberID
		AND ps.sActive = 'Y'
	SELECT @lSiteID = @theSiteID
	END
-- end of Find partnersite



--IF (@security = 2) or (@security = 5)
SELECT @sql = ' 
SELECT  DISTINCT -- TOP 10 
	  m.lMemberID
	, m.szFirstName
	, m.szLastName
	, m.szLoginName
	, m.szLoginEmail
	, m.sActive 
--  ,bs.sStatus
	, ms.lSecurityLevelID
	, p.lPartnerID
	, p.szPartnerName
	, ps.lSiteID
	, ps.szSiteName
 
FROM dbo.tblLP_MemberInfo m
JOIN dbo.tblLP_MemberSecurity ms on m.lMemberID = ms.lMemberID
JOIN dbo.tblLP_PartnerSiteMember psm on m.lMemberID = psm.lMemberID
JOIN dbo.tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
JOIN dbo.tblLP_Partner p on p.lPartnerID = ps.lPartnerID
'

SELECT @sql = @sql + 'WHERE 1=1 '  

IF @lMemberID IS NOT NULL
BEGIN
SELECT @sql = @sql + ' AND m.lMemberID = ('''+CONVERT(varchar(25), @lMemberID)+''') '  
END

IF @active = 'Y'  
BEGIN  
SELECT @sql = @sql + ' AND m.sActive = ''Y'''
END
 
IF @operation = 'exact'  
BEGIN
	IF @szLoginEmail IS NOT NULL
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '    
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		= ('''+@szLastName+''') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	= ('''+@szLoginName+''') '    
 
END

IF @operation = 'startwith'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column Like ('+@column+'%)'  
*/  
BEGIN     
	IF @szLoginEmail IS NOT NULL
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '    
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		LIKE ('''+@szLastName+'%'') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	LIKE ('''+@szLoginName+'%'') '   
 
END

IF @operation = 'like'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column LIKE (%'+@column+'%)'  
*/  
BEGIN    
	IF @szLoginEmail IS NOT NULL
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '    
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		LIKE (''%'+@szLastName+'%'') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	LIKE (''%'+@szLoginName+'%'') '     
 
END

-- mod by Linh; to handle narrowing the search based on Partner/PartnerSite
if @lSiteID IS NOT NULL
	BEGIN
	SELECT @sql = @sql + ' AND ps.lSiteID = ('''+CONVERT(varchar(25), @lSiteID)+''') '  
	END
if @lPartnerID IS NOT NULL
	BEGIN
	SELECT @sql = @sql + ' AND p.lPartnerID = ('''+CONVERT(varchar(25), @lPartnerID)+''') '  
	END
--
IF @sort IS NULL
SELECT @orderby = ' m.szLastName' /*default*/ + ' asc'  
ELSE  
SELECT @orderby = @Sort + '  ' + @direction  


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--PRINT @sql   
EXEC (@sql)
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_AdminUser_to_Manage] TO [web_user]
GO
