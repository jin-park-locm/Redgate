SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[usp_RW_GET_Reviewer_Search]
  @szLastName		varchar(50)		= NULL
, @szLoginEmail		varchar(150)	= NULL
, @szDisplayName	varchar(20)		= NULL,

@operation			varchar(10)		=	'exact',	-- Search Methods: 'exact', 'startwith', 'like'  
@sort				varchar(100)	=	NULL,		-- Column to sort on  
@direction			varchar(5)		=	' asc'		-- Sort order  

AS
 
 
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE   
@sql		varchar(8000),    
@orderby	varchar(100) 

SELECT @sql = '', @orderby = ''

SELECT @sql = '
SELECT  DISTINCT   
	  m.lMemberID
	, m.szLoginEmail
	, m.szFirstName
	, m.szLastName
	, p.szDisplayName
 FROM tblLP_MemberInfo		m   
 JOIN tblRW_UserInfo		p			ON m.lMemberId	 = p.lMemberId  
 LEFT JOIN tblLP_BusListing	b			ON b.lMemberID   = m.lMemberID
 WHERE   1= 1'
 

IF @operation = 'exact'  
BEGIN   
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		= ('''+@szLastName+''') '  
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginEmail	= ('''+@szLoginEmail+''') '
	IF @szDisplayName IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szDisplayName	= ('''+@szDisplayName+''') '
END

IF @operation = 'startwith'  
BEGIN   
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName		LIKE ('''+@szLastName+'%'') '  
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginEmail	LIKE ('''+@szLoginEmail+'%'') ' 
	IF @szDisplayName IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szDisplayName	LIKE ('''+@szDisplayName+'%'') ' 
END

IF @operation = 'like' 
BEGIN   
	IF @szLastName IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLastName LIKE (''%'+@szLastName+'%'') '  
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + ' AND m.szLoginEmail LIKE (''%'+@szLoginEmail+'%'') ' 
	IF @szDisplayName IS NOT NULL  
	SELECT @sql = @sql + ' AND p.szDisplayName LIKE (''%'+@szDisplayName+'%'') ' 
END

	SELECT @sql = @sql + ' AND m.sActive = ''Y''  AND	m.sUserType IN (''RR'', ''BR'')'

IF @sort IS NULL 
	SELECT @orderby = ' m.szLastName' /*default*/ + ' asc'  
ELSE  
	SELECT @orderby = @Sort + ' ' + @direction  
 

SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--SELECT @sql  
EXEC (@sql)
GO
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_RW_GET_Reviewer_Search] TO [web_user]
GO
