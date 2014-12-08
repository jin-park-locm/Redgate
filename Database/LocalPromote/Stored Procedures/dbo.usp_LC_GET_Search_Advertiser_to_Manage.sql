SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE  PROCEDURE [dbo].[usp_LC_GET_Search_Advertiser_to_Manage]
@lMemberID		int			= NULL,
@logged_in_lMemberID int    = NULL,
@szLoginEmail	varchar(150) = NULL,
@szLastName		Varchar(50) = null,
@szFirstName	Varchar(50) = null,
@szLoginName	Varchar(50) = null,
@active			char(1)		= null,

@szBusName		varchar(150) = NULL,
@szPhone		Varchar(10) = null,

@lSiteID		int			= NULL,
@lPartnerID		int			= NULL,

@operation		varchar(10)	= NULL,		-- Search Methods: 'exact', 'startwith', 'like'  
@sort			varchar(100)= NULL,		-- Column to sort on  
@direction		varchar(5) = ' asc'  		-- Sort order  
--, @group varchar(100) = NULL			-- Column to group on 
as
-- usp_LC_GET_Search_Advertiser_to_Manage_New @lMemberID = 24815,@logged_in_lMemberID = 24815, @active = 'Y'
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
DECLARE   
@sql			varchar(8000),		-- Dynamic t-sql statement  
@security		int,				-- Member Security Level  
@orderby		varchar(100),		-- Compound Order By clause  
@theSiteID		int,
@thePartnerID	int

SELECT @security = lSecurityLevelID   
FROM tblLP_MemberSecurity   
WHERE lMemberID = @logged_in_lMemberID  
--  select * from tblAL_SecurityLevel
--SELECT @security
SELECT @sql = ' 
SELECT  DISTINCT -- TOP 10 
	  m.lMemberID
	, m.szFirstName
	, m.szLastName
	, m.szLoginName
	, m.szLoginEmail
--    ,bs.sStatus  
	, m.sActive 
	, p.lPartnerID
	, p.szPartnerName	
	,ps.lSiteID
	,ps.szSiteName 

FROM dbo.tblLP_BusListing b  
join dbo.tblLP_MemberInfo m on m.lMemberID = b.lMemberID
JOIN dbo.tblLP_MemberSecurity ms ON ms.lMemberID = m.lMemberID and ms.lSecurityLevelID = ''1''
--join dbo.tblLP_BusListingStatus bs on bs.lAdvertiserID = b.lAdvertiserID
left join tblLP_MemberPhone mp ON mp.lMemberID = m.lMemberID  AND mp.sPhoneType <> ''F'' 
left join dbo.tblLP_ProductOrder po on po.lAdvertiserID = b.lAdvertiserID  and po.sActive = ''Y''
left join dbo.tblLP_ProductCampaign pc on pc.lCIDNo = po.lCIDNo 
join dbo.tblLP_PartnerListing pl on pl.lAdvertiserID = b.lAdvertiserID  
join dbo.tblLP_PartnerSite   ps on ps.lSiteID = pl.lSiteID  
join dbo.tblLP_Partner    p  on p.lPartnerID = ps.lPartnerID  
 '

SELECT @sql = @sql + ' WHERE 1=1 ' 

IF @active = 'Y'  
BEGIN  
SELECT @sql = @sql + ' AND m.sActive = ''Y'''
END

IF  @lMemberID IS NOT NULL
BEGIN
--	IF (@security = 2)  OR (@security = 5) 
	SELECT @sql = @sql + ' AND m.lMemberID = ('''+CONVERT(varchar(25), @lMemberID)+''') '  
--	ELSE IF (@security = 3 ) OR (@security = 4 )
--	SELECT @sql = @sql + ' AND pm.lMemberID = ('''+CONVERT(varchar(25), @lMemberID)+''') '  
END
IF @security = 3
BEGIN
	SELECT @thePartnerID = pt.lPartnerID 
	FROM tblLP_PartnerSiteMember psm 
	JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
	JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
	WHERE psm.lMemberID = @logged_in_lMemberID
	AND pt.sActive = 'Y'

	SELECT @lPartnerID = @thePartnerID

--	SELECT @sql = @sql + ' 	p.lPartnerID = '+CONVERT(varchar(25), @thePartnerID  )

END

IF @security = 4  
BEGIN

	SELECT @theSiteID = ps.lSiteID 
	FROM tblLP_PartnerSiteMember psm 
	JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
	JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
	WHERE psm.lMemberID = @logged_in_lMemberID
		AND ps.sActive = 'Y'

	SELECT @lSiteID = @theSiteID

--	SELECT @sql = @sql + ' 	ps.lSiteID = '+CONVERT(varchar(25),@theSiteID)+' AND
--							ps.sSiteType = ''PS'' '
END

-- SELECT @sql = @sql + ' AND m.sActive	= ('''+@sActive+''') '  
IF @active = 'Y'  
BEGIN  
SELECT @sql = @sql + ' AND m.sActive = ''Y'''
END

IF @operation = 'exact'  
BEGIN

	IF @szBusName IS NOT NULL  
	SELECT @sql = @sql + ' AND b.szTitle		= ('''+@szBusName+''') '  
	IF @szPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND mp.szPhone		= ('''+@szPhone+''') '     
	IF @szLoginEmail IS NOT NULL
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '    
	IF @szFirstName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szFirstName	= ('''+@szFirstName+''') '  
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
	IF @szBusName IS NOT NULL  
	SELECT @sql = @sql + ' AND b.szTitle		LIKE ('''+@szBusName+'%'') '  
	IF @szPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND mp.szPhone		LIKE ('''+@szPhone+'%'') '  
   
	IF @szLoginEmail IS NOT NULL
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '    

	IF @szFirstName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szFirstName	LIKE ('''+@szFirstName+'%'') '  
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
	IF @szBusName IS NOT NULL  
	SELECT @sql = @sql + ' AND b.szTitle		LIKE (''%'+@szBusName+'%'') '  
	IF @szPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND mp.szPhone		LIKE (''%'+@szPhone+'%'') '  
   
	IF @szLoginEmail IS NOT NULL
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '    

	IF @szFirstName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szFirstName	LIKE (''%'+@szFirstName+'%'') '  
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		LIKE (''%'+@szLastName+'%'') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	LIKE (''%'+@szLoginName+'%'') '     
 
END

IF @lSiteID IS NOT NULL
	BEGIN
	SELECT @sql = @sql + ' AND ps.lSiteID = ('''+CONVERT(varchar(25), @lSiteID)+''') '  
	END
IF @lPartnerID IS NOT NULL
	BEGIN
	SELECT @sql = @sql + ' AND p.lPartnerID = ('''+CONVERT(varchar(25), @lPartnerID)+''') '  
	END

IF @sort IS NULL
SELECT @orderby = ' m.szFirstName' /*default*/ + ' asc'  
ELSE  
SELECT @orderby = @Sort + '  ' + @direction  

SELECT @sql = @sql + ' ORDER BY ' + @orderby  
-- PRINT @sql   
EXEC (@sql)

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Advertiser_to_Manage] TO [web_user]
GO
