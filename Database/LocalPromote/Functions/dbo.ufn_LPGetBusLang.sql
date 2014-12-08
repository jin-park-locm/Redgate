SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE      function [dbo].[ufn_LPGetBusLang]
/**********************************************************************************
Description   :   ufn_LPGetBusLang

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development
01-06-2009 bwu		added CDATA

EXAMPLES:			select dbo.ufn_LPGetBusLang(72129)		

<row>Japanese</row><row>Hebrew</row><row>Chinese</row><row>English</row>

<row><![CDATA[Japanese]]></row><row><![CDATA[Hebrew]]></row><row><![CDATA[Chinese]]></row><row><![CDATA[English]]></row>	

**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText, '') + ISNULL('<row><![CDATA[' + szLanguage + ']]></row>', '') 
	FROM	(select  lAdvertiserID, szLanguage
			 from	 tblLP_BusLanguageSpoken bls join 
					 tblAL_Language ala on bls.lLanguageID = ala.lLanguageID
			where bls.sActive='Y') as Lang
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN   Left(@ConcaText,2000)	
END 
GO
