SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
 
 
 
 
CREATE function [dbo].[ufn_LPGetBusCounty]
/**********************************************************************************
Description   :   Get the business service county for the AID
 
Change History
 
Date       Name     Description
---------- -------- ------------------------------------
11-18-2008 dlabrie    Initial Development
01-06-2009 bwu                  added cdata wrapper
 
EXAMPLES:         Select distinct dbo.ufn_LPGetBusCounty(ladvertiserid) 
from tblLP_BusServiceLocation where ladvertiserid=15220
 
<row>Tarrant</row><row>Denton</row><row>Dallas</row><row>Collin</row>
 
<row><![CDATA[Tarrant]]></row><row><![CDATA[Denton]]></row><row><![CDATA[Dallas]]></row><row><![CDATA[Collin]]></row>
 
**********************************************************************************/
( 
@AID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
Declare @CountyText VARCHAR(2000)
       
SELECT @CountyText = ISNULL(@CountyText+'<row>', '') + ISNULL('<![CDATA['+szLocationName+']]>','')+'</row>'
from        dbo.tblLP_BusServiceLocation blo, dbo.tblAL_StateCounty al 
WHERE   lAdvertiserID=@AID 
and blo.lStateCountyID = al.lStateCountyID
 
RETURN   Left('<row>' + @CountyText,2000)        
END
 
 
GO
