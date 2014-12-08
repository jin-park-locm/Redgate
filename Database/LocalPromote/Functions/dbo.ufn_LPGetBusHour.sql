SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE      function [dbo].[ufn_LPGetBusHour]
/**********************************************************************************
Description   :   ufn_LPGetBusHour

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development
01-06-2009 bwu		added cdata

EXAMPLES: 			select distinct dbo.ufn_LPGetBusHour(ladvertiserid) from tblLP_BusHour
					where ladvertiserid = 34476

<row><DayOfWeek>MON</DayOfWeek><OpenHour>8:00am</OpenHour><CloseHour>4:30pm</CloseHour></row>
<row><DayOfWeek>TUE</DayOfWeek><OpenHour>8:00am</OpenHour><CloseHour>4:30pm</CloseHour></row>
<row><DayOfWeek>WED</DayOfWeek><OpenHour>8:00am</OpenHour><CloseHour>4:30pm</CloseHour></row>
<row><DayOfWeek>THU</DayOfWeek><OpenHour>8:00am</OpenHour><CloseHour>4:30pm</CloseHour></row>
<row><DayOfWeek>FRI</DayOfWeek><OpenHour>8:00am</OpenHour><CloseHour>4:30pm</CloseHour></row>
<row><DayOfWeek>SAT</DayOfWeek><OpenHour>10:00am</OpenHour><CloseHour>2:00pm</CloseHour></row>
<row><DayOfWeek>SUN</DayOfWeek><OpenHour>Closed</OpenHour><CloseHour>Closed</CloseHour></row>

<row><DayOfWeek><![CDATA[MON]]></DayOfWeek><OpenHour><![CDATA[8:00am]]></OpenHour><CloseHour><![CDATA[4:30pm]]></CloseHour></row>
<row><DayOfWeek><![CDATA[TUE]]></DayOfWeek><OpenHour><![CDATA[8:00am]]></OpenHour><CloseHour><![CDATA[4:30pm]]></CloseHour></row>
<row><DayOfWeek><![CDATA[WED]]></DayOfWeek><OpenHour><![CDATA[8:00am]]></OpenHour><CloseHour><![CDATA[4:30pm]]></CloseHour></row>
<row><DayOfWeek><![CDATA[THU]]></DayOfWeek><OpenHour><![CDATA[8:00am]]></OpenHour><CloseHour><![CDATA[4:30pm]]></CloseHour></row>
<row><DayOfWeek><![CDATA[FRI]]></DayOfWeek><OpenHour><![CDATA[8:00am]]></OpenHour><CloseHour><![CDATA[4:30pm]]></CloseHour></row>
<row><DayOfWeek><![CDATA[SAT]]></DayOfWeek><OpenHour><![CDATA[10:00am]]></OpenHour><CloseHour><![CDATA[2:00pm]]></CloseHour></row>
<row><DayOfWeek><![CDATA[SUN]]></DayOfWeek><OpenHour><![CDATA[Closed]]></OpenHour><CloseHour><![CDATA[Closed]]></CloseHour></row>

					select distinct dbo.ufn_LPGetBusHour(ladvertiserid) from tblLP_BusHour
					where ladvertiserid = 34476

					select * from tblLP_BusHour where ladvertiserid in (34476, 72859)
**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)

    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull(szBusHour,'')	
	FROM	(select	lAdvertiserID, 
			        case when sHideHr = 'Y' then ''
						 when s24Hr='Y' then '<row><OpenHour><![CDATA[Open 24 Hours]]></OpenHour>' + 
							case when ltrim(rtrim(isnull(szComment, ''))) = '' then ''
								else isNull('<Comment><![CDATA[' + szComment + ']]></Comment>','') end + '</row>'
						 else '<row><DayOfWeek><![CDATA[' + sDayOfWeek + ']]></DayOfWeek><OpenHour><![CDATA[' + szOpenHour + 
								']]></OpenHour><CloseHour><![CDATA[' + 
								szCloseHour+']]></CloseHour></row>' end as szBusHour				
			 from	tblLP_BusHour where sActive='Y' and lAdvertiserID=@lAdvertiserID 
			)	as BusHour
	RETURN  Left(@ConcaText,2000)
END 
GO
