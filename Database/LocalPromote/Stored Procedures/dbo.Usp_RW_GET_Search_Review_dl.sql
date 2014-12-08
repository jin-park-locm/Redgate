SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Usp_RW_GET_Search_Review_dl]
@lReviewID			int				=	NULL,
@szReviewTitle		varchar(100)	=	NULL,
@szDisplayName		varchar(20)		=	NULL,
@szLoginEmail		varchar(100)	=	NULL, 
@sztitle			varchar(150)	=   NULL,

@operation			varchar(10)		=	'exact',	-- Search Methods: 'exact', 'startwith', 'like'  
@sort				varchar(100)	=	NULL,		-- Column to sort on  
@direction			varchar(5)		=	' asc'	,	-- Sort order   
@group				varchar(100)	=	NULL 
AS


DECLARE   
@sql		varchar(8000),     
@lMemberID	int,      
@orderby	varchar(100),
@groupby	varchar (100)



SELECT @sql = '  
SELECT 
	  l.lReviewID
	, b.title 
	, u.szDisplayName
	, m.szLoginEmail
	, l.szReviewTitle
	, l.szReviewText
	, m.szLoginEmail 
FROM tblRW_LocalReview l 
JOIN ListingStoreMaster..acx_tbl_listing b ON l.RID = b.RID --b.lMemberID   = l.lMemberID
JOIN tblRW_UserInfo		u ON u.lMemberId = l.lMemberId
JOIN tbllp_MemberInfo	m ON m.lMemberId = l.lMemberId
WHERE l.sActive = ''Y'' ' 

IF @lReviewID IS NOT NULL  
SELECT @sql = @sql + 'AND l.lReviewID = '+Convert(Varchar(15),@lReviewID)+''  


IF @operation = 'exact'  
BEGIN   
	IF @szReviewTitle IS NOT NULL  
	SELECT @sql = @sql + 'AND l.szReviewTitle	= ('''+@szReviewTitle+''') '  
	IF @szDisplayName IS NOT NULL  
	SELECT @sql = @sql + 'AND u.szDisplayName	= ('''+@szDisplayName+''') ' 
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + 'AND m.szLoginEmail	= ('''+@szLoginEmail+''') '  
	IF @sztitle IS NOT NULL  
	SELECT @sql = @sql + 'AND b.title			= ('''+@sztitle+''') '  

END

IF @operation = 'startwith'  
BEGIN   
	IF @szReviewTitle IS NOT NULL  
	SELECT @sql = @sql + 'AND l.szReviewTitle	LIKE ('''+@szReviewTitle+'%'') ' 
	IF @szDisplayName IS NOT NULL  
	SELECT @sql = @sql + 'AND u.szDisplayName	LIKE ('''+@szDisplayName+'%'') ' 
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + 'AND m.szLoginEmail	LIKE ('''+@szLoginEmail+'%'') ' 
	IF @sztitle IS NOT NULL  
	SELECT @sql = @sql + 'AND b.title			LIKE ('''+@sztitle+'%'') ' 
END

IF @operation = 'like' 
BEGIN   
	IF @szReviewTitle IS NOT NULL  
	SELECT @sql = @sql + 'AND l.szReviewTitle	LIKE (''%'+@szReviewTitle+'%'') ' 
	IF @szDisplayName IS NOT NULL  
	SELECT @sql = @sql + 'AND u.szDisplayName	LIKE (''%'+@szDisplayName+'%'') ' 
	IF @szLoginEmail IS NOT NULL  
	SELECT @sql = @sql + 'AND m.szLoginEmail	LIKE (''%'+@szLoginEmail+'%'') ' 
	IF @sztitle IS NOT NULL  
	SELECT @sql = @sql + 'AND b.title			LIKE (''%'+@sztitle+'%'') ' 

END


IF @group IS NULL
	SELECT @groupby = ' l.lMemberID' /*default*/  
ELSE  
	SELECT @groupby = ' l.'+@group  

IF @sort IS NULL 
	SELECT @orderby = 'l.szReviewTitle' /*default*/ + ' asc'  
ELSE  
	SELECT @orderby = @Sort + ' ' + @direction  
 

SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--SELECT @sql  
EXEC (@sql)
--PRINT (@sql)
/*
go
usp_RW_GET_Search_Review_dl @sztitle='Chucks QA Services',@operation='exact',@direction='asc',@sort='szReviewTitle'
*/
GO
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_RW_GET_Search_Review_dl] TO [web_user]
GO
