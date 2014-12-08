SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




 CREATE  PROCEDURE [dbo].[usp_LC_GET_Search_Campaign_to_Manage]
	 @lMemberID			int     	--,@szCID				varchar(30)	= NULL    ,@lCIDNo			int			= NULL    ,@lSiteID			int			= NULL    ,@szSpecialName		varchar(60) = NULL    ,@szSpecialDesc		varchar(60) = NULL    ,@sTimeCode			char(2)		= NULL    ,@dtBeginning		datetime	= NULL    ,@dtEnd				datetime	= NULL	,@lPartnerID		int			= NULL    ,@sActive			char(1)		= NULL    ,@Status		    char(8)		= 'ALL' --- all (default) -active -inactive
	,@operation		varchar(10)		= 'exact',		-- Search Methods: 'exact', 'startwith', 'like'  
	 @sort			varchar(100)	= NULL,		-- Column to sort on  
	 @direction		varchar(5)		= ' asc'  		-- Sort order  
--, @group varchar(100) = NULL			-- Column to group on 
as 
SET NOCOUNT ON
/*
 
usp_LC_GET_Search_Campaign_to_Manage @lMemberID='323052',@szSpecialName='a',
@lPartnerID = 121 , @operation='startwith',@direction='asc' 

usp_LC_GET_Search_Campaign_to_Manage @lMemberID='323052',@szSpecialName='a',
@lSiteID = 1334 , @operation='startwith',@direction='asc' 

usp_LC_GET_Search_Campaign_to_Manage @lMemberID='323052',@szSpecialName='a',
  @operation='startwith',@direction='asc' 


*/

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
DECLARE   
@sql		varchar(8000),		-- Dynamic t-sql statement  
@security	int,				-- Member Security Level  
@orderby	varchar(100)		-- Compound Order By clause  


SELECT @sql = ' 
    SELECT DISTINCT 		--  m.lMemberID,         pc.[szCID]        ,pc.[lCIDNo]        ,pc.[lProductID]        ,pc.[szSpecialName]        ,pc.[szSpecialDesc]		,pc.[mSpecialPrice]        ,pc.[sDefault]        ,pc.[sDependency]        , t.[szTimeTermName] AS sTimeCode         ,pc.[dtBeginning]        ,pc.[dtEnd]        ,pc.[sActive]        ,pc.[szUpdatedBy]        ,pc.[dtUpdate]        ,ps.[lSiteID]		,ps.[szSiteName]		, p.[lPartnerID]		, p.[szPartnerName]        	FROM  [dbo].[tblLP_ProductCampaign]		pc	JOIN  [dbo].[tblLP_PartnerSite]			ps		 ON pc.lSiteID	= ps.lSiteID	JOIN  [dbo].[tblLP_Partner]				p		 ON p.lPartnerID = ps.lPartnerID 	JOIN  [dbo].[tblAL_TimeTerm]			t		 ON t.sTimeCode = pc.sTimeCode     WHERE 1 = 1
	 ' 
  
--SELECT @security = lSecurityLevelID   
--FROM tblLP_MemberSecurity   
--WHERE lMemberID = @lMemberID  
 
IF @Status	= 'Active'
		SELECT @sActive = 'Y'
IF @Status = 'inActive'
		SELECT @sActive = 'N'
IF @Status = 'All'
		SELECT @sActive = NULL
 
IF @sActive IS NOT NULL
SELECT @sql = @sql + ' AND pc.sActive	= ISNULL('''+@sActive+''',pc.sActive) '  
IF @sActive IS NULL
SELECT @sql = @sql + ' AND pc.sActive	= pc.sActive '  
 
--IF (@lSiteID IS NOT NULL  ) AND (@security = 2 OR @security = 5 or @security = 3 )
--	SELECT @sql = @sql + ' AND ps.lSiteID		=  '+Convert(Varchar(10),@lSiteID)+''

IF (@lPartnerID IS NOT NULL ) --AND (@security = 2 OR @security = 5 )
	SELECT @sql = @sql + ' AND p.lPartnerID		=  '+Convert(Varchar(10),@lPartnerID)+''  
  

IF (@lSiteID IS NOT NULL  ) --AND ( @security = 4)
BEGIN
SELECT @sql = @sql + ' AND ps.lSiteID		=  '+Convert(Varchar(10),@lSiteID)+'' 
--SELECT @sql = @sql + ' AND ps.sSiteType		= ''PS'''
END

--	IF (@lPartnerID IS NOT NULL ) AND ( @security = 3)
--	BEGIN
--	SELECT @sql = @sql + ' AND p.lPartnerID		=  '+Convert(Varchar(10),@lPartnerID)+'' 
--	SELECT @sql = @sql + ' AND ps.sSiteType		= ''PT'''
--	END
/*
	IF @lCIDNo IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.lCIDNo		=  '+Convert(Varchar(10),@lCIDNo)+'' 
	IF @lCIDNo IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.lCIDNo		=  '+Convert(Varchar(10),@lCIDNo)+'' 
*/
	IF @dtBeginning IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.dtBeginning	= ('''+Convert(Varchar(25),@dtBeginning)+''') ' 
	IF @dtEnd IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.dtEnd		= ('''+Convert(Varchar(25),@dtEnd)+''') ' 

IF @operation = 'exact'  
BEGIN    
	IF @lCIDNo IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.lCIDNo		= ('''+Convert(Varchar(25),@lCIDNo)+''') '  
	IF @szSpecialName IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.szSpecialName	= ('''+@szSpecialName+''') '    
	IF @szSpecialDesc IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.szSpecialDesc		= ('''+@szSpecialDesc+''') '  
	IF @sTimeCode IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.sTimeCode	= ('''+@sTimeCode+''') '   
END

IF @operation = 'startwith'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column Like ('+@column+'%)'  
*/  
BEGIN     

	IF @lCIDNo IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.lCIDNo			LIKE ('''+Convert(Varchar(25),@lCIDNo)+'%'') '  
	IF @szSpecialName IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.szSpecialName	LIKE ('''+@szSpecialName+'%'') '  
	IF @szSpecialDesc IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.szSpecialDesc	LIKE ('''+@szSpecialDesc+'%'') '  
	IF @sTimeCode IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.sTimeCode		LIKE ('''+@sTimeCode+'%'') '  

END
 
IF @operation = 'like'  
/*  
IF @column IS NOT NULL  
SELECT @sql = @sql + ' AND column LIKE (%'+@column+'%)'  
*/  
BEGIN    
	IF @lCIDNo IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.lCIDNo			LIKE (''%'+Convert(Varchar(25),@lCIDNo)+'%'') '  
	IF @szSpecialName IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.szSpecialName	LIKE (''%'+@szSpecialName+'%'') '  
	IF @szSpecialDesc IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.szSpecialDesc	LIKE (''%'+@szSpecialDesc+'%'') '  
	IF @sTimeCode IS NOT NULL  
	SELECT @sql = @sql + ' AND pc.sTimeCode		LIKE (''%'+@sTimeCode+'%'') '  

END 

IF @sort IS NULL
SELECT @orderby = ' pc.[lCIDNo]' /*default*/ + ' asc'  
ELSE  
SELECT @orderby = @Sort + '  ' + @direction  


SELECT @sql = @sql + ' ORDER BY ' + @orderby  
--PRINT @sql   
EXEC (@sql)
 



GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Search_Campaign_to_Manage] TO [web_user]
GO
