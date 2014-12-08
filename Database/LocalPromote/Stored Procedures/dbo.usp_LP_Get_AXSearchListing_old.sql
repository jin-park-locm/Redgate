SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[usp_LP_Get_AXSearchListing_old]

--*** delete this after 03/31/2011 


/**********************************************************************************
Description   :   Find the buiness listing accoding to the information entered by
                  user on a web form. 

Change History

Date       Name     Description
---------- -------- ------------------------------------
02-23-2010 jipark	Initial Development

EXAMPLES: 	
		usp_LP_Get_AXListing2 '7147777166','','',''
		usp_LP_Get_AxListing2 '','international house of pancakes','Riverside','CA'
		
**********************************************************************************/

@PhoneNumber		VARCHAR(10),
@BusinessName		VARCHAR(255),
@City				VARCHAR(255),
@State				VARCHAR(50)
as

SET NOCOUNT ON

IF isnull(@PhoneNumber,'') = ''
BEGIN -- BusinessName and city search.
	DECLARE @TitleSearch VARCHAR(255)
	DECLARE @TitleStrip VARCHAR(255)
	SET @BusinessName = isnull(ltrim(rtrim(@BusinessName)),'')
	SET @City = isnull(ltrim(rtrim(@City)),'')
	SET @State = isnull(ltrim(rtrim(@State)),'')
	IF @BusinessName = '' or @City = '' or @State = ''
		return
	SET @TitleSearch = left(dbo.glb_fn_NormalizeListingTitle(@BusinessName),7) + '%'
	SET @TitleStrip = left(dbo.ufn_StrippingTitle(@BusinessName),7) + '%'
	if (select count(*) from tblLP_BusListing WHERE	szCity = @City and sState = @State and sAction not in ('DND','DEL')
				and (left(szTitleSearch,7) like @TitleSearch or left(szTitleStrip,7) like @TitleStrip)) > 0
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
	FROM		tblLP_BusListing A
	LEFT outer join dbo.vwLP_ListingOrderStatus B
		ON A.lAdvertiserID = B.lAdvertiserID
	Inner Join dbo.tblLP_BusListingStatus C
		ON A.lAdvertiserID = C.lAdvertiserID
			and C.sLastStatus ='Y'
	Inner Join dbo.tblAL_StatusType D
		ON C.sStatus = D.sStatus
	WHERE		szCity = @City and sState = @State and sAction not in ('DND','DEL')
				and (left(szTitleSearch,7) like @TitleSearch or left(szTitleStrip,7) like @TitleStrip)
END
ELSE
BEGIN -- PhoneNumber search (EXACT)
	if (select count(*) from tblLP_BusListing where szPhone = @PhoneNumber and sAction not in ('DND','DEL')) > 0
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
	FROM		tblLP_BusListing A
	LEFT outer join dbo.vwLP_ListingOrderStatus B
		ON A.lAdvertiserID = B.lAdvertiserID
	Inner Join dbo.tblLP_BusListingStatus C
		ON A.lAdvertiserID = C.lAdvertiserID
			and C.sLastStatus ='Y'
	Inner Join dbo.tblAL_StatusType D
		ON C.sStatus = D.sStatus
	WHERE		szPhone = @PhoneNumber and sAction not in ('DND','DEL')
END

GO
