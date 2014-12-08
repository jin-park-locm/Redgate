SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[Usp_LC_GET_Search_Advertiser]
@lMemberID		int			= NULL,
@szLastName		Varchar(50) = null,
@szFirstName	Varchar(50) = null,
@szLoginName	Varchar(50) = null,
@szPhone		Varchar(10) = null,
@szLoginEmail	Varchar(150) = null,
@szBusName		varchar(150) = null,

@operation		varchar(10)	= NULL,		-- Search Methods: 'exact', 'startwith', 'like'  
@sort			varchar(100)= NULL,		-- Column to sort on  
@direction		varchar(5) = ' asc'  		-- Sort order  
--, @group varchar(100) = NULL			-- Column to group on 
as

/*
	usp_LC_GET_Search_Advertiser @szLastName='Chuck',@operation='exact',@direction='asc',@sort='szLastName'
*/

SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
DECLARE   
@sql		varchar(8000),		-- Dynamic t-sql statement  
--@security	int,				-- Member Security Level  
@orderby	varchar(100)		-- Compound Order By clause  

SELECT @szPhone = REPLACE(REPLACE(REPLACE(REPLACE(@szPhone,' ',''),'(',''),')',''),'-','')
--SELECT @lMemberID = RTRIM(LTRIM(@lMemberID))
 
if @szBusName is null
	Begin
		SELECT @sql = ' 
		SELECT  DISTINCT 
			  m.lMemberID
			, m.szLoginEmail
			, m.szFirstName
			, m.szLastName
			, m.szLoginName
			, m.szLoginEmail
			, mp.szPhone

		--FROM tblLP_BusListing b JOIN 
		FROM tblLP_MemberInfo m			
		--on m.lMemberID = b.lMemberID
		left outer join tblLP_MemberPhone mp ON mp.lMemberID = m.lMemberID  AND mp.sPhoneType <> ''F'' 
		join tblLP_MemberSecurity ms		on ms.lMemberID = m.lMemberID 
		WHERE ms.lSecurityLevelID = 1 '
	End 
else
	Begin
		SELECT @sql = ' 
		SELECT  DISTINCT 
			  m.lMemberID
			, m.szLoginEmail
			, m.szFirstName
			, m.szLastName
			, m.szLoginName
			, m.szLoginEmail
			, mp.szPhone

		--FROM tblLP_BusListing b JOIN 
		FROM tblLP_MemberInfo m		
		inner join tblLP_BusListing l on m.lMemberID = l.lMemberID	
		--on m.lMemberID = b.lMemberID
		left outer join tblLP_MemberPhone mp ON mp.lMemberID = m.lMemberID  AND mp.sPhoneType <> ''F'' 
		join tblLP_MemberSecurity ms		on ms.lMemberID = m.lMemberID 
		WHERE ms.lSecurityLevelID = 1 '

	End

--lSecurityLevelID = 1 is an advertiser security level

IF @lMemberID IS NOT NULL
BEGIN  
	SELECT @sql = @sql + ' AND m.lMemberID			= ('''+convert(Varchar(25), @lMemberID) +''') ' 
END

IF @operation = 'exact'  
BEGIN   
	IF @szBusName IS NOT NULL  
	SELECT @sql = @sql + ' AND l.szTitle		= ('''+@szBusName+''') '  
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '  
	IF @szFirstName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szFirstName	= ('''+@szFirstName+''') '  
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		= ('''+@szLastName+''') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	= ('''+@szLoginName+''') '    
	IF @szPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND mp.szPhone		= ('''+@szPhone+''') '  
END

IF @operation = 'startwith'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column Like ('+@column+'%)'  
*/  
BEGIN    
	IF @szBusName IS NOT NULL  
	SELECT @sql = @sql + ' AND l.szTitle		LIKE ('''+@szBusName+'%'') ' 
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '  
	IF @szFirstName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szFirstName	LIKE ('''+@szFirstName+'%'') '  
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		LIKE ('''+@szLastName+'%'') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	LIKE ('''+@szLoginName+'%'') '   
	IF @szPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND mp.szPhone		LIKE ('''+@szPhone+'%'') ' 
END

IF @operation = 'like'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column LIKE (%'+@column+'%)'  
*/  
BEGIN   
	IF @szBusName IS NOT NULL  
	SELECT @sql = @sql + ' AND l.szTitle		LIKE (''%'+@szBusName+'%'') ' 
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '  
	IF @szFirstName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szFirstName	LIKE (''%'+@szFirstName+'%'') '  
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		LIKE (''%'+@szLastName+'%'') '  
	IF @szLoginName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginName	LIKE (''%'+@szLoginName+'%'') '     
	IF @szPhone IS NOT NULL  
	SELECT @sql = @sql + ' AND mP.szPhone		LIKE (''%'+@szPhone+'%'') '  
END

IF @sort = null  
SELECT @orderby = ' m.szFirstName' /*default*/ + ' asc'  
ELSE  
SELECT @orderby = @Sort + '  ' + @direction  


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--PRINT @sql   
EXEC (@sql)

GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_Advertiser] TO [web_user]
GO
