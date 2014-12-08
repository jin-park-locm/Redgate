SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/**********************************************************************************
Description   :   Create local promote content to disply in local.com. Called by
					acx_GetExtendedData

Change History

Date       Name     Description
---------- -------- ------------------------------------
09-08-08   dlabrie    Make a copy of the original code
09-09-08   bwu		  Modified title not showing if no content
11-20-08   bwu        Changed to return content in XML format

EXAMPLES:	select * from vw_localpromocontentData where lAdvertiserID = 72792
**********************************************************************************/

CREATE View [dbo].[vw_localpromocontentData]
AS
SELECT 	bl.lAdvertiserID,
	'<?xml version="1.0" encoding="ISO-8859-1" ?>' +
	'<ProfileContent>' +
		CASE WHEN bc.szTagLine is null or ltrim(rtrim(bc.szTagLine))='' THEN '' 
			ELSE '<TagLine><![CDATA[' + LEFT(bc.szTagLine, 175) + ']]></TagLine>' END + 
		CASE WHEN bd.szBusDesc is null or ltrim(rtrim(bd.szBusDesc))='' THEN ''
			ELSE '<BusDesc><![CDATA[' + LEFT(bd.szBusDesc, 3000) + ']]></BusDesc>' END +		
		ISNULL('<Services><![CDATA[' + dbo.ufn_LPGetBusService(bl.lAdvertiserID) + ']]></Services>', '') + 
		ISNULL('<Products><![CDATA[' + dbo.ufn_LPGetBusProduct(bl.lAdvertiserID) + ']]></Products>', '') + 
		ISNULL('<Brands><![CDATA[' + dbo.ufn_LPGetBusBrand(bl.lAdvertiserID) + ']]></Brands>', '') + 
		ISNULL('<Specialties><![CDATA[' + dbo.ufn_LPGetBusSpecialty(bl.lAdvertiserID) + ']]></Specialties>', '') +

		CASE WHEN bl.szEmail IS NULL or rtrim(ltrim(bl.szEmail))='' or charindex('@',bl.szEmail)=0 or charindex('.',bl.szEmail) = 0  or (bl.szEmail = 'hl@yext.com') THEN '' 
			ELSE '<BusinessEmail><![CDATA[' + bl.szEmail + ']]></BusinessEmail>' END + 		

--		CASE WHEN bc.szYearEstablished IS NULL OR bc.szYearEstablished = '' THEN '' 
--			ELSE '<YearEstablished><![CDATA[' + bc.szYearEstablished + ']]></YearEstablished>' END + 
--		CASE WHEN bc.lEmployeeTotal IS NULL THEN '' 
--			ELSE '<NumberOfEmployees><![CDATA[' + CONVERT(varchar(10), bc.lEmployeeTotal) + ']]></NumberOfEmployees>' END + 
--		CASE WHEN bc.lLocationTotal IS NULL THEN '' 
--			ELSE '<NumberOfLocations><![CDATA[' + CONVERT(varchar(10), bc.lLocationTotal) + ']]></NumberOfLocations>' END + 
--		ISNULL('<AreasServed>' + dbo.ufn_LPGetBusCounty(bl.lAdvertiserID) + '</AreasServed>', '') + 
		CASE WHEN dbo.ufn_LPGetBusHour(bl.lAdvertiserID) IS NULL OR dbo.ufn_LPGetBusHour(bl.lAdvertiserID) = '' THEN '' 
			ELSE '<HoursOfOperation>' + dbo.ufn_LPGetBusHour(bl.lAdvertiserID) + '</HoursOfOperation>' END + 

		CASE WHEN isnull(dbo.ufn_LPGetAdditionalBusHour(bl.lAdvertiserID), '') = '' THEN '' 
			ELSE '<AdditionalHours><![CDATA[' + dbo.ufn_LPGetAdditionalBusHour(bl.lAdvertiserID) + ']]></AdditionalHours>' END + 
	
		ISNULL('<LanguageSpoken>' + dbo.ufn_LPGetBusLang(bl.lAdvertiserID) + '</LanguageSpoken>', '') + 
		ISNULL('<PaymentMethod>' + dbo.ufn_LPGetPaymentMethod(bl.lAdvertiserID) + '</PaymentMethod>', '') + 
--		CASE WHEN bc.szReturnPolicy IS NULL OR bc.szReturnPolicy = '' THEN '' 
--			ELSE '<ReturnPolicy><![CDATA[' + bc.szReturnPolicy + ']]></ReturnPolicy>' END + 
--		ISNULL('<BusinessAssociation>' + dbo.ufn_LPGetBusAsso(bl.lAdvertiserID) + '</BusinessAssociation>', '') + 		
--		CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') = 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[Female Owned]]></row><row><![CDATA[Minority Owned]]></row><row><![CDATA[24 Hours Emergency Service is Available]]></row></AdditionalInformation>'  
--			ELSE '' END + 
--		CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') <> 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[Female Owned]]></row><row><![CDATA[Minority Owned]]></row></AdditionalInformation>'    
--			ELSE '' END + 
--		CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') <> 'Y' and isNull(bc.sEmergency, '') = 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[Female Owned]]></row><row><![CDATA[24 Hours Emergency Service is Available]]></row></AdditionalInformation>'  
--			ELSE '' END + 
--		CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') <> 'Y' and isNull(bc.sEmergency, '') <> 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[Female Owned]]></row></AdditionalInformation>'  
--			ELSE '' END + 
--		CASE WHEN isNull(bc.sFemale, '') <> 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') = 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[Minority Owned]]></row><row><![CDATA[24 Hours Emergency Service is Available]]></row></AdditionalInformation>'  
--			ELSE '' END + 
--		CASE WHEN isNull(bc.sFemale, '') <> 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') <> 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[Minority Owned]]></row></AdditionalInformation>'  
--			ELSE '' END + 
--		CASE WHEN isNull(bc.sFemale, '') <> 'Y' and isNull(bc.sMinority, '') <> 'Y' and isNull(bc.sEmergency, '') = 'Y'
--			THEN '<AdditionalInformation><row><![CDATA[24 Hours Emergency Service is Available]]></row></AdditionalInformation>'  
--			ELSE '' END +
		CASE WHEN dbo.ufn_LPGetBusDiscounts(bl.lAdvertiserID) IS NULL OR dbo.ufn_LPGetBusDiscounts(bl.lAdvertiserID) = '' THEN '' 
			ELSE isNull('<Discount>' + dbo.ufn_LPGetBusDiscounts(bl.lAdvertiserID) + '</Discount>', '') END + 
	'</ProfileContent>' AS [Content]

FROM	dbo.tblLP_BusListing bl (nolock) LEFT OUTER JOIN
        dbo.tblLP_BusDescription bd (nolock) ON bl.lAdvertiserID = bd.lAdvertiserID LEFT OUTER JOIN
        dbo.tblLP_BusListingContent bc (nolock) ON bl.lAdvertiserID = bc.lAdvertiserID


GO
GRANT SELECT ON  [dbo].[vw_localpromocontentData] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[vw_localpromocontentData] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[vw_localpromocontentData] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[vw_localpromocontentData] TO [lcssui]
GRANT SELECT ON  [dbo].[vw_localpromocontentData] TO [web_user]
GO
