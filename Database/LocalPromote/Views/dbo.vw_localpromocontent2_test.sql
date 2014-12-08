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

EXAMPLES: 
**********************************************************************************/

CREATE View [dbo].[vw_localpromocontent2_test]
AS
SELECT 	bl.lAdvertiserID,
	'<table class="hoverimage" border="0"><tr>' + '<td valign=top width=65%>' + 
	'<table cellpadding=10 cellspacing=5 width=100% border="0">' + 
	CASE 	WHEN dbo.GetConcaBusPho(bl.lAdvertiserID) IS NULL OR dbo.GetConcaBusPho(bl.lAdvertiserID) = '' 
		THEN 	'' 
		ELSE 	'<tr><td><b>Business Photos:</b><BR>' + 
			isNull(dbo.GetConcaBusPho(bl.lAdvertiserID), '') + '</td></tr>' + '<tr><td height=5></td></tr>'  
		END + 
	'<tr><td valign=top>' + 
		CASE WHEN bc.szTagLine is null or ltrim(rtrim(bc.szTagLine))='' THEN ''
		ELSE '<b><i>' + LEFT(bc.szTagLine, 100)+ '</i></b><BR><BR>'
		END + 
		CASE WHEN bd.szBusDesc is null or ltrim(rtrim(bd.szBusDesc))='' THEN ''
		ELSE	'<b>What We Do:</b><BR>' + LEFT(bd.szBusDesc, 3000) + '<BR><BR>' 
		END +
		ISNULL('<b>Business Services:</b><BR>' + dbo.GetConcaService(bl.lAdvertiserID) + '<BR><BR>', '') + 
		ISNULL('<b>Business Products:</b><BR>' + dbo.GetConcaProduct(bl.lAdvertiserID) + '<BR><BR>', '') + 
		ISNULL('<b>Brands Offered:</b><BR>' + dbo.GetConcaBrand(bl.lAdvertiserID) + '<BR><BR>', '') + 
		ISNULL('<b>Business Specialty:</b><BR>' + dbo.GetConcaBusSpecialty(bl.lAdvertiserID) + '<BR><BR>', '') +
	'</td></tr>' + 
	'</table>' + 
	'</td><td valign=top ><table cellpadding=10 cellspacing=5 border="0"><tr>' + 
	'<td style="width: 15em; word-wrap: break-word">' + 
	CASE WHEN bl.szEmail IS NULL or rtrim(ltrim(bl.szEmail))='' or charindex('@', bl.szEmail) = 0 THEN '' 
		ELSE '<b>Business Email:</b><BR><a href="mailto:' + bl.szEmail + '">' + bl.szEmail + '</a><BR><BR>' 
		END + 
	CASE WHEN bc.szYearEstablished IS NULL OR bc.szYearEstablished = '' THEN '' 
		ELSE '<b>Year Established:</b>&nbsp;&nbsp;' + bc.szYearEstablished + '<BR><BR>' 
		END + 
	CASE WHEN bc.lEmployeeTotal IS NULL THEN '' 
		ELSE '<b>Number of Employee(s):</b>&nbsp;&nbsp;' + CONVERT(varchar(10), bc.lEmployeeTotal) + '<BR><BR>' 
		END + 
	CASE WHEN bc.lLocationTotal IS NULL THEN '' 
		ELSE '<b>Number of Location(s):</b>&nbsp;&nbsp;' + CONVERT(varchar(10), bc.lLocationTotal) + '<BR><BR>' 
		END + 
	ISNULL('<b>Area(s) Served:</b>' + '<UL>' + dbo.GetConcaBusCounty(bl.lAdvertiserID) + '</UL><BR>', '') + 
	CASE WHEN dbo.GetConcaBusHour(bl.lAdvertiserID) IS NULL OR dbo.GetConcaBusHour(bl.lAdvertiserID) = '' 
		THEN '' 
		ELSE isNull('<b>Hours of Operation:</b><BR><Table>' + dbo.GetConcaBusHour(bl.lAdvertiserID) + '</Table><BR>', '') 
		END + 
	ISNULL('<b>Language(s) Spoken:</b>' + '<UL>' + dbo.GetConcaLang(bl.lAdvertiserID) + '</UL><BR>', '') + 
	ISNULL('<b>Payment Method:</b>' + '<UL>' + dbo.GetConcaPayMethod(bl.lAdvertiserID) + '</UL><BR>', '') + 
	CASE WHEN bc.szReturnPolicy IS NULL OR bc.szReturnPolicy = '' 
		THEN '' 
		ELSE '<b>Return Policy:</b><BR>' + bc.szReturnPolicy + '<BR><BR>' 
		END + 
	ISNULL('<b>Business Association:</b>' + '<UL>' + dbo.GetConcaBusAsso(bl.lAdvertiserID) + '</UL><BR>', '') + 		
	CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') = 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>Female Owned</LI>' + '<LI>Minority Owned</LI>' + '<LI>24 Hours Emergency Service is Available</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 
	CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') <> 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>Female Owned</LI>' + '<LI>Minority Owned</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 
	CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') <> 'Y' and isNull(bc.sEmergency, '') = 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>Female Owned</LI>' + '<LI>24 Hours Emergency Service is Available</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 
	CASE WHEN isNull(bc.sFemale, '') = 'Y' and isNull(bc.sMinority, '') <> 'Y' and isNull(bc.sEmergency, '') <> 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>Female Owned</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 
	CASE WHEN isNull(bc.sFemale, '') <> 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') = 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>Minority Owned</LI>' + '<LI>24 Hours Emergency Service is Available</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 
	CASE WHEN isNull(bc.sFemale, '') <> 'Y' and isNull(bc.sMinority, '') = 'Y' and isNull(bc.sEmergency, '') <> 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>Minority Owned</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 
	CASE WHEN isNull(bc.sFemale, '') <> 'Y' and isNull(bc.sMinority, '') <> 'Y' and isNull(bc.sEmergency, '') = 'Y'
		THEN '<b>Additional Information:</b><UL>' + '<LI>24 Hours Emergency Service is Available</LI>' + '</UL><BR>'    
		ELSE '' 
		END + 	
	CASE WHEN dbo.GetConcaBusDisc(bl.lAdvertiserID) IS NULL OR dbo.GetConcaBusDisc(bl.lAdvertiserID) = '' 
		THEN '' 
		ELSE isNull('<b>Discounts:</b><UL>' + dbo.GetConcaBusDisc(bl.lAdvertiserID) + '</UL><BR>', '')
		END + 
	'</td></tr></table></td></tr>' + '</table>' AS [Content]
FROM	dbo.tblLP_BusListing AS bl LEFT OUTER JOIN
        dbo.tblLP_BusDescription AS bd ON bl.lAdvertiserID = bd.lAdvertiserID LEFT OUTER JOIN
        dbo.tblLP_BusListingContent AS bc ON bl.lAdvertiserID = bc.lAdvertiserID

GO
GRANT SELECT ON  [dbo].[vw_localpromocontent2_test] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[vw_localpromocontent2_test] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[vw_localpromocontent2_test] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[vw_localpromocontent2_test] TO [lcssui]
GRANT SELECT ON  [dbo].[vw_localpromocontent2_test] TO [web_user]
GO
