SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[vw_localpromocontent2_old]
as
select  

		bc.ladvertiserid, --as ListingAX,
/*		
      , 'localPromote' AS Identifier
      , 'description' AS ContentType
      , URL AS ContentUrl
      , NULL AS contentTitle
      , CASE WHEN URL IS NULL
             THEN '' 
             ELSE 'More Info '
        END AS contentDisplayUrl
      , 
*/

        '<table class="hoverimage"><tr>'
	+	'<td valign=top width=65%>'



	+	'<table cellpadding=10 cellspacing=5 width=100%><tr><td class=functionbox><b>Business Photos:</b><BR>'
	+   isNull(dbo.GetConcaBusPho(bc.lAdvertiserID),'')
	+	'</td></tr>'
    +   '<tr></td height=5><td></tr>'
	+   '<tr><td valign=top class=functionbox>' 
        +  isnull('<b><i>'+ isNull(Left(bc.szTagline,100),'') +'</i></b><BR><BR>','') 

        + '<b>What We Do:</b><BR>' +  isNull(Left(bd.szBusDesc,1500),'') + '<BR><BR>'

        + isNull('<b>Business Services:</b><BR>' +  dbo.GetConcaService(bc.lAdvertiserID) + '<BR><BR>','')
            

        + isNull('<b>Business Products:</b><BR>' +  dbo.GetConcaProduct(bc.lAdvertiserID) + '<BR><BR>', '')

        + isNull('<b>Brands Offered:</b><BR>' +  dbo.GetConcaBrand(bc.lAdvertiserID) + '<BR><BR>','')

		+ isNull('<b>Business Specialty:</b><BR>' +  dbo.GetConcaBusSpecialty(bc.lAdvertiserID) + '<BR><BR>','')

        + '</td></tr>'



	+	'</table>'




	+	'</td><td valign=top ><table cellpadding=10 cellspacing=5><tr><td class=functionbox style="width: 15em; word-wrap: break-word">'

	+ CASE WHEN bl.szEmail IS NULL 
             THEN '' 
             ELSE '<b>Business Email:</b><BR><a href="mailto:' + bl.szEmail + '">' + bl.szEmail + '</a><BR><BR>' 
        END  

	+ CASE WHEN bc.szYearEstablished IS NULL 
             THEN ''
             ELSE '<b>Year Established:</b>&nbsp;&nbsp;' + bc.szYearEstablished + '<BR><BR>' 
        END  

	+ CASE WHEN bc.lEmployeeTotal IS NULL 
             THEN ''
             ELSE '<b>Number of Employee(s):</b>&nbsp;&nbsp;' + convert(varchar(10) , bc.lEmployeeTotal) + '<BR><BR>' 
        END  

	+ CASE WHEN bc.lLocationTotal IS NULL  
             THEN '' 
             ELSE '<b>Number of Location(s):</b>&nbsp;&nbsp;' + convert(varchar(10) , bc.lLocationTotal) + '<BR><BR>' 
        END  


	+ isNull('<b>Area(s) Served:</b>' + '<UL>'+ dbo.GetConcaBusCounty(bc.lAdvertiserID) + '</UL>' , '')
      

	+ isNull('<b>Hours of Operation:</b><BR><Table>' + dbo.GetConcaBusHour(bc.lAdvertiserID)+ '</Table><BR>' , '')
          

	+ isNull('<b>Language(s) Spoken:</b>' + '<UL>' + dbo.GetConcaLang(bc.lAdvertiserID) + '</UL>' , '')


	+ isNull('<b>Payment Method:</b>' + '<UL>'+ dbo.GetConcaPayMethod(bc.lAdvertiserID) + '</UL>' , '')
        
	+ CASE WHEN bc.szReturnPolicy IS NULL or bc.szReturnPolicy=''
             THEN '' 
             ELSE '<b>Return Policy:</b><BR>' + bc.szReturnPolicy + '<BR><BR>' 
        END 

	+ isNull('<b>Business Association:</b>' + '<UL>'+ dbo.GetConcaBusAsso(bc.lAdvertiserID) + '</UL>' , '')
 

	+ '<b>Additional Information:</b><UL>'

	+ CASE WHEN isNull(bc.sFemale,'') = 'Y'
           THEN '<LI>Female Owned'
		   ELSE ''
      END 

	+ CASE WHEN isNull(bc.sMinority,'') = 'Y'
           THEN '<LI>Minority Owned'
		   ELSE ''
      END 

	+ CASE WHEN isNull(bc.sEmergency,'') = 'Y'
           THEN '<LI>24 Hours Emergency Service is Available'
		   ELSE ''
      END 

	+ isNull(dbo.GetConcaBusDisc(bc.lAdvertiserID),'')
        
	+ '</UL></td></tr></table></td></tr>' 

    + '</table>' as Content
--      , AdvertiserId as PartnerRID
--      , 'LP' as AgencyId

From	tblLP_BusListingContent bc 
		left join tblLP_BusDescription bd on bc.lAdvertiserid=bd.lAdvertiserid 
		left join tblLP_BusListing bl on bc.lAdvertiserid = bl.lAdvertiserid 

GO
GRANT SELECT ON  [dbo].[vw_localpromocontent2_old] TO [lcssui]
GRANT SELECT ON  [dbo].[vw_localpromocontent2_old] TO [web_user]
GO
