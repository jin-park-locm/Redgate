SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_Search_PartnerSite]  
@lMemberID		int		= NULL,
@szSiteName	Varchar(50) = NULL,
@sSitePhone	Varchar(10)  = NULL,
@szSiteEmail	Varchar(100) = NULL,
@sActive		char(1)		 = null,

@operation		varchar(10)	= 'exact',		-- Search Methods: 'exact', 'startwith', 'like'  
@sort			varchar(100)= NULL,		-- Column to sort on  
@direction		varchar(5)  = ' asc',  		-- Sort order  

@lPartnerID int = NULL -- mod by Linh

as
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
DECLARE   
@sql		varchar(8000),		-- Dynamic t-sql statement  
@security	int,				-- Member Security Level  
@orderby	varchar(100)		-- Compound Order By clause  
SELECT @orderby = ''

SELECT @sql = ' 
SELECT  DISTINCT 
		 s.lSiteID
		,p.lPartnerID
		,p.szPartnerName
		,s.szSiteName
		,s.sSitePhone
		,s.szSiteEmail
		,d.szSiteDirectoryURL
		,s.szSSURL
		,s.sActive
		,s.sSiteType

FROM tblLP_PartnerSite			s	 
-- JOIN tblLP_PartnerSiteMember	m		ON m.lSiteID = s.lSiteID    --commented by Linh
left JOIN tblLP_PartnerSiteDirectoryURL d	ON d.lSiteID = s.lSiteID -- was JOIN, left JOIN added by Linh
JOIN tblLP_Partner p					ON p.lPartnerID = s.lPartnerID
WHERE 1=1 '
--------- Mod by Linh -----------------------------------------
--IF @lMemberID IS NOT NULL
--BEGIN  
	--SELECT @sql = @sql + ' AND m.lMemberID			= ('''+convert(Varchar(25), @lMemberID) +''') ' 
--END

SELECT @security = lSecurityLevelID  
FROM tblLP_MemberSecurity  
WHERE lMemberID = @lMemberID

IF @security = 3 
BEGIN
	-- Find the partner based on lMemberID
	DECLARE @thePartnerID varchar(25)

	SELECT @thePartnerID = pt.lPartnerID 
	FROM tblLP_PartnerSiteMember psm 
	JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
	JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
	WHERE psm.lMemberID = @lMemberID
	AND pt.sActive = 'Y'
	-- end of Find partner

	SELECT @sql = @sql + ' AND p.lPartnerID	= ('''+ @thePartnerID+''') '   
END

IF  (@security = 2 OR @security = 5) AND (@lPartnerID IS NOT NULL)
	BEGIN
	--SELECT @sql = @sql + ' AND p.lPartnerID	= ('''+ @lPartnerID+''') ' 
	SELECT @sql = @sql + ' AND p.lPartnerID = ('''+CONVERT(varchar(25), @lPartnerID)+''') '  
	END

IF @security = 4 

	BEGIN
		RETURN
	END




------ End of mod by Linh -----------------------------------

IF @operation = 'exact'  
BEGIN   

	IF @szSiteName IS NOT NULL  
	SELECT @sql = @sql + ' AND s.szSiteName	= ('''+@szSiteName+''') '  
	IF @sSitePhone IS NOT NULL  
	SELECT @sql = @sql + ' AND s.sSitePhone	= ('''+@sSitePhone+''') '  
	IF @szSiteEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND s.szSiteEmail	= ('''+@szSiteEmail+''') ' 

END

IF @operation = 'startwith'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column Like ('+@column+'%)'  
*/  

BEGIN    
	IF @szSiteName IS NOT NULL  
	SELECT @sql = @sql + ' AND s.szSiteName	LIKE ('''+@szSiteName+'%'') '  
	IF @sSitePhone IS NOT NULL  
	SELECT @sql = @sql + ' AND s.sSitePhone	LIKE ('''+@sSitePhone+'%'') ' 
	IF @szSiteEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND s.szSiteEmail	LIKE ('''+@szSiteEmail+'%'') ' 

END
 
IF @operation = 'like'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column LIKE (%'+@column+'%)'  
*/  
BEGIN   

	IF @szSiteName IS NOT NULL  
	SELECT @sql = @sql + ' AND s.szSiteName	LIKE (''%'+@szSiteName+'%'') '  
	IF @sSitePhone IS NOT NULL  
	SELECT @sql = @sql + ' AND s.sSitePhone	LIKE (''%'+@sSitePhone+'%'') ' 
	IF @szSiteEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND s.szSiteEmail	LIKE (''%'+@szSiteEmail+'%'') ' 
 
END

IF @sActive IS NOT NULL
	SELECT @sql = @sql + ' AND s.sActive	= ('''+@sActive+''') ' 
	--SELECT @sql = @sql + ' AND (s.sActive	= ('''+@sActive+''') OR s.sSiteType = ''PT'') ' 
ELSE 
	--SELECT @sql = @sql + ' AND (s.sActive	= ''Y'' OR (s.sActive =	''N'' AND s.sSiteType = ''PS'') OR (s.sActive =	''D'' AND s.sSiteType = ''PS'')) ' 
	SELECT @sql = @sql + ' AND (s.sActive	<> ''I'')'  -- sActive of I is for PartnerPartnerSites that are created by new LPAdmin.
IF @sort IS NULL  

SELECT @orderby = ' s.szSiteName ' /*default*/ + ' asc' 
ELSE  
SELECT @orderby = @Sort + ' ' + @direction  


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--PRINT @sql   
EXEC (@sql)
/*
go
--usp_LC_GET_Search_PartnerSite @operation='exact',@direction='asc',@sort='szSiteName',@lPartnerID='389',@sActive='Y',@lMemberID='323054'
usp_LC_GET_Search_PartnerSite @operation='startwith',@direction='asc',@sort='szSiteName',@lPartnerID='389',@lMemberID='323054'

*/
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_PartnerSite] TO [web_user]
GO
