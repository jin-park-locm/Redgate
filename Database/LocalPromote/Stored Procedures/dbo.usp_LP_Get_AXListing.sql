SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_Get_AXListing]
/**********************************************************************************
Description   :   Find the buiness listing accoding to the information entered by
                  user on a web form. 

Change History

Date       Name     Description
---------- -------- ------------------------------------
01-08-2007 Hchen    Initial Development
07-31-2007 cwine	ModIFied to take only Search Term and ZipCode AS parameters
08-13-2007 dlabrie	Modify the search to include the existing records in LP
03-10-2008 dlaBrie	Remove the search in acx_tbl_Listing and add city+state search in Zipcode box
03-12-2008 dlaBrie	add Title+City search in the Search box
03--8-2009 dlabrie	add titleSearch replace sztitle in search

EXAMPLES: 	
		usp_LP_Get_AXListing 'Quintessentials','del mar, CA' 
		usp_LP_Get_AXListing 'Quintessentials, del mar','CA' --- n
		usp_LP_Get_AXListing 'Quintessentials','92130'
 		usp_LP_Get_AXListing 'Quintessentials','CA, del mar' 
 		usp_LP_Get_AXListing 'Quintessentials, CA','CA, del mar' 
		usp_LP_Get_AXListing 'Quintessentials','92130, CA'  
		usp_LP_Get_AXListing 'Quintessentials, 92130','92130, CA'  
		usp_LP_Get_AXListing 'car', '92612'
		usp_LP_Get_AXListing 'Best Buy', 'New York'
		usp_LP_Get_AXListing '5226 N. 108th Ct','53225' ---IN LP
		usp_LP_Get_AXListing '4079927616','32828' ---IN LP
		usp_LP_Get_AXListing'Rapid Rehab','89117' --- IN LP ONLY NOT IN AX
		usp_LP_Get_AXListing'Rapid Rehab, las vegas, nv','89117'
		usp_LP_Get_AXListing 'Pacific Food Mart','90250'-- NOT IN LP
		usp_LP_Get_AXListing '118 W Main St','54124' -- NOT IN LP
		usp_LP_Get_AXListing '7705298888','30303' -- NOT IN LP
		usp_LP_Get_AXListing 'lee''s cars','92673' -- mot IN LP
		usp_LP_Get_AXListing '24/7 Mobile Locksmith', '14606'
**********************************************************************************/

@SearchTerm		 VARCHAR(255),    -- Search Term
@ZipCode           	 VARCHAR(50)     -- ZipCode
-- @SearchType		 Tinyint

as
SET NOCOUNT ON


DECLARE @PhoneNumber VARCHAR(255)
DECLARE @TitleSearch VARCHAR(255)
DECLARE @TitleStrip VARCHAR(255)

SET @SearchTerm = ISNULL(LTRIM(RTRIM(@SearchTerm)),'')
SET @ZipCode = ISNULL(LTRIM(RTRIM(replace(replace(@ZipCode,',',''),' ',''))),'')

IF @SearchTerm = '' or @ZipCode = ''
	return

SET @PhoneNumber = REPLACE(REPLACE(REPLACE(REPLACE(@SearchTerm,' ',''),'(',''),')',''),'-','')
SET @TitleSearch = '%'+dbo.glb_fn_NormalizeListingTitle(SUBSTRING(@SearchTerm,1,25)) + '%'
SET @TitleStrip = '%'+dbo.ufn_StrippingTitle(SUBSTRING(@SearchTerm,1,25)) + '%'

-- Select @ZipCode, @SearchTerm, @TitleSearch, @TitleStrip	  
-- SELECT 	* FROM tblLP_BusListing WHERE	SUBSTRING(sPostalCode,1,5)=@ZipCode  and ((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))

IF (SELECT 	COUNT(*) FROM tblLP_BusListing
	WHERE	SUBSTRING(sPostalCode,1,5)=@ZipCode and sAction <> 'DND' 
			and ((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip)))>0
	BEGIN	
	SELECT		RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
	FROM		tblLP_BusListing
	WHERE		SUBSTRING(sPostalCode,1,5)=@ZipCode 
				and	((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))
				and sAction <> 'DND'
	END

ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing WHERE szPhone = @PhoneNumber and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE  szPhone = @PhoneNumber and sAction <> 'DND'
		END
	ELSE
		BEGIN
		IF 	(SELECT COUNT(*) FROM tblLP_BusListing
			WHERE  SUBSTRING(sPostalCode,1,5) = @ZipCode and sAction <> 'DND'
			and dbo.glb_fn_NormalizeListingTitle(SUBSTRING(Isnull(szStreetName,''),1,25)) like @TitleSearch)>0
			BEGIN

			SELECT	
				RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
			FROM	tblLP_BusListing
			WHERE  SUBSTRING(sPostalCode,1,5) = @ZipCode 
				and dbo.glb_fn_NormalizeListingTitle(SUBSTRING(ISNULL(szStreetName,''),1,25)) like @TitleSearch
				and sAction <> 'DND'
			END
ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing WHERE replace(szcity+sState,' ','') = @zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   replace(szcity+sState,' ','') = @zipcode
		and		((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))				
		and		sAction <> 'DND'
		END
ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing WHERE replace(sState+szcity,' ','') = @zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   replace(sState+szcity,' ','')= @zipcode
		and		((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))				
		and		sAction <> 'DND'
		END
ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing WHERE replace(szcity,' ','') = @zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   replace(szcity,' ','')= @zipcode
		and		((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))				
		and		sAction <> 'DND'
		END

ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing WHERE replace(spostalCode+sState,' ','') = @zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   replace(spostalCode+sState,' ','')= @zipcode
		and		((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))				
		and		sAction <> 'DND'
		END

ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing WHERE replace(sState,' ','') = @zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   replace(sState,' ','')= @zipcode
		and		((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))				
		and		sAction <> 'DND'
		END
ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing 
		WHERE SUBSTRING(replace(replace(szTitle+szCity,' ',''),',',''),1,25) like @TitleStrip
		and sPostalcode=@zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   SUBSTRING(replace(replace(szTitle+szCity,' ',''),',',''),1,25) like @TitleSearch
		AND	sPostalcode=@zipcode and		sAction <> 'DND'
		END
ELSE
	BEGIN
	IF	(SELECT COUNT(*) FROM tblLP_BusListing 
		WHERE SUBSTRING(replace(replace(szTitle+szCity,' ',''),',',''),1,25) like @TitleStrip
		and sState=@zipcode and sAction <> 'DND')>0
		BEGIN
		SELECT	RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
		FROM	tblLP_BusListing
		WHERE   SUBSTRING(replace(replace(szTitle+szCity,' ',''),',',''),1,25) like @TitleSearch
		AND	sState=@zipcode and		sAction <> 'DND'
		END

ELSE
	SELECT		RIDAX as RID ,
				lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed
			FROM	tblLP_BusListing
			WHERE  SUBSTRING(sPostalCode,1,5) = @ZipCode 
			and		((SUBSTRING(szTitleSearch,1,25) like @TitleSearch) or (SUBSTRING(szTitleStrip,1,25) like @TitleStrip))				
			and		sAction <> 'DND'
	--Select @TitleStrip		
	---select @searchTerm
END
END
END
END
END
END
END
END
End
GO
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXListing] TO [web_user]
GO
