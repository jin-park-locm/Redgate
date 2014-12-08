SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_Get_BusinessListingByRID]

/**********************************************************************************
File Name     :   usp_LP_Get_BusinessListing.sql
Description   :   Find the buiness listing accoding to the information entered by
                  user on a web form. 

Change History

Date       Name     Description
---------- -------- ------------------------------------
01-08-2007 Hchen    Initial Development
03-15-2007 dLaBrie  Add URL table to make sure the correct URL shown
08-06-2007 cwine	Changed ListingID to RID
08-13-2007 dlabrie	Include the search in LP table 
03-11-2008 dlabrie   JIRA LPIS18 - Look up listing by @LAdvertiserID in LP first, 
			if not found then look up by @RID in LP (RIDAX), 
			if not found then look up by @RID in axciom. 
09-10-2008	jkang	synced the field names

example       :   
		usp_LP_Get_BusinessListingByRID '125056','5689br'-- string for advertiserid
		usp_LP_Get_BusinessListingByRID '39695291','27'	-- correct advertiserid
		usp_LP_Get_BusinessListingByRID '39695291','265872' -- bad advertiserid matched by RIDAX		
		usp_LP_Get_BusinessListingByRID '235','JB' 
**********************************************************************************/

@RID 		int,
--@AgencyID 	char(2)
@Advertiserid 	varchar(20)

AS
SET NOCOUNT ON

IF (select count(*) from tblLP_BusListing (nolock) where ladvertiserid=@Advertiserid and isnumeric(@Advertiserid)=1)>0
	
 BEGIN
	SELECT	--RIDAX as RID,
		RIDAX as RID,
		tblLP_BusListing.lAdvertiserid AS Advertiserid,
		szTitle as Title,
		szStreetName as Address,
		szCity as City,
		sState as State,
		sPostalCode as ZipCode,
		szPhone as PhoneNumber,
		szBusDesc as Description,
		szURL as URL,
		'Y' AS Claimed
	FROM	tblLP_BusListing (nolock) LEFT OUTER JOIN
		tblLP_BusDescription (nolock)
	ON	tblLP_BusListing.lAdvertiserid=tblLP_BusDescription.lAdvertiserid	
	WHERE   tblLP_BusListing.lAdvertiserid=@Advertiserid
 END

ELSE
 BEGIN
	IF(Select count(*) from tblLP_BusListing (nolock) where RIDAX=@RID)>0
	BEGIN
	SELECT	
		RIDAX as RID,
		tblLP_BusListing.lAdvertiserid AS Advertiserid,
		szTitle as Title,
		szStreetName as Address,
		szCity as City,
		sState as State,
		sPostalCode as ZipCode,
		szPhone as PhoneNumber,
		szBusDesc as Description,
		szURL as URL,
		'Y' AS Claimed
	FROM	tblLP_BusListing (nolock) LEFT OUTER JOIN
		tblLP_BusDescription (nolock)
	ON	tblLP_BusListing.lAdvertiserid=tblLP_BusDescription.lAdvertiserid	
	WHERE   tblLP_BusListing.RIDAX=@RID
	END
ELSE
	BEGIN
	SELECT 	RID, 
		Null as Advertiserid, 
       	Title, 
       	Address,
       	City,
       	State,
       	ZipCode,
       	PhoneNumber,
	   	Description,
	   	URL,
	   	CASE WHEN Claimed is Null THEN 'N'
		ELSE Claimed
	   	END AS Claimed	
	FROM   ListingStoreMaster..acx_tbl_listing (nolock)
	WHERE  RID = @rid

END
END
GO
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_BusinessListingByRID] TO [web_user]
GO
