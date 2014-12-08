SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_Get_AXSearchListing]
/**********************************************************************************
Description   :   Find the buiness listing accoding to the information entered by
                  user on a web form. 

Change History

exec LocalPromote.dbo.usp_LP_Get_AXSearchListing @PhoneNumber=NULL,@BusinessName='testthisagain',@City='Irvine',@State='CA'

Date       Name     Description
---------- -------- ------------------------------------
02-23-2010 jipark	Initial Development
01/25/2011 P Field	Corrected performance issue (time-out) 

EXAMPLES: 	
		usp_LP_Get_AXSearchListing '7147777166','','',''
		usp_LP_Get_AXSearchListing '','international house of pancakes','Riverside','CA'
		
		Exec usp_LP_Get_AXSearchListing @PhoneNumber=NULL,@BusinessName='testthisagain',@City='Irvine',@State='CA'

		
**********************************************************************************/

@PhoneNumber		VARCHAR(10),
@BusinessName		VARCHAR(255),
@City				VARCHAR(255),
@State				VARCHAR(50)
as

SET NOCOUNT ON

declare @Phone_Number VARCHAR(10),
	@Business_Name		VARCHAR(255),
	@City_name				VARCHAR(255),
	@State_name				VARCHAR(50)

set @Phone_Number = @PhoneNumber
set @Business_Name = @BusinessName
set @City_name = @City
set @State_name = @State


IF isnull(@Phone_Number,'') = ''
BEGIN -- BusinessName and city search.
	-- print 'phone number is null' 
	DECLARE @TitleSearch VARCHAR(255)
	DECLARE @TitleStrip VARCHAR(255)
	SET @Business_Name = isnull(ltrim(rtrim(@Business_Name)),'')
	SET @City_name = isnull(ltrim(rtrim(@City_name)),'')
	SET @State_name = isnull(ltrim(rtrim(@State_name)),'')
	IF @Business_Name = '' or @City_name = '' or @State_name = ''
	begin
		-- print 'empty input parameters' 
		return (0) 
	end ;  
	SET @TitleSearch = left(dbo.glb_fn_NormalizeListingTitle(@Business_Name),7) + '%'
	SET @TitleStrip = left(dbo.ufn_StrippingTitle(@Business_Name),7) + '%'
	if (select count(*) from tblLP_BusListing  with(nolock) 
				WHERE	szCity = @City_name and sState = @State_name and sAction not in ('DND','DEL')
				and (left(szTitleSearch,7) like @TitleSearch 
							or left(szTitleStrip,7) like @TitleStrip)) > 0
	SELECT		RIDAX as RID ,
				A.lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed,
				lmemberid as MemberID,
				C.sStatus as Status,
				szStatusDesc as StatusDesc,
				isnull(lLevel, 2) as Level,
				isnull(szLevelDesc, 'Basic')as LevelDesc
	FROM		tblLP_BusListing A with(nolock) 
	LEFT outer join dbo.vwLP_ListingOrderStatus B with(nolock) 
		ON A.lAdvertiserID = B.lAdvertiserID
	Inner Join dbo.tblLP_BusListingStatus C with(nolock) 
		ON A.lAdvertiserID = C.lAdvertiserID
			and C.sLastStatus ='Y'
	Inner Join dbo.tblAL_StatusType D with(nolock) 
		ON C.sStatus = D.sStatus
	WHERE		szCity = @City_name and sState = @State_name and sAction not in ('DND','DEL')
				and (left(szTitleSearch,7) like @TitleSearch 
						or left(szTitleStrip,7) like @TitleStrip)
END
ELSE
BEGIN -- PhoneNumber search (EXACT)
	if (select count(*) from tblLP_BusListing  with(nolock) 
			where szPhone = @Phone_Number and sAction not in ('DND','DEL')) > 0
	SELECT		RIDAX as RID ,
				A.lAdvertiserid as Advertiserid,
				szTitle as Title,
				CASE sHideAddress when  'Y' then 'Serving Your Area' Else szStreetName END as Address,
				szCity as City,
				sState as State,
				sPostalCode as ZipCode,
				szPhone as PhoneNumber,
				Null AS Description,
				szURL as URL,
				'Y' AS Claimed,
				lmemberid as MemberID,
				C.sStatus as Status,
				szStatusDesc as StatusDesc,
				isnull(lLevel, 2) as Level,
				isnull(szLevelDesc, 'Basic')as LevelDesc
	FROM		tblLP_BusListing A with(nolock) 
	LEFT outer join dbo.vwLP_ListingOrderStatus B with(nolock) 
		ON A.lAdvertiserID = B.lAdvertiserID
	Inner Join dbo.tblLP_BusListingStatus C with(nolock) 
		ON A.lAdvertiserID = C.lAdvertiserID
			and C.sLastStatus ='Y'
	Inner Join dbo.tblAL_StatusType D with(nolock) 
		ON C.sStatus = D.sStatus
	WHERE	szPhone = @Phone_Number and sAction not in ('DND','DEL')
END ; 

GO
GRANT EXECUTE ON  [dbo].[usp_LP_Get_AXSearchListing] TO [lcssui]
GO
