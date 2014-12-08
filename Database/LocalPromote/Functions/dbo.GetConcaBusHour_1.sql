SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetConcaBusHour_1]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)


    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull(szBusHour,'')	
	FROM	(select	lAdvertiserID, lbusHourid,
			        case when sHideHr = 'Y' then ''
						 when s24Hr='Y' then 'Open 24 Hours'+isNull('<br/>'+szComment,'')
						 else '<tr><td>'+sDayOfWeek+':</td><td>'+szOpenHour+' - '+ szCloseHour+'</td></tr>'  
					end as szBusHour				
			 from	tblLP_BusHour where sActive='Y'
			)	as BusHour
	WHERE   lAdvertiserID=@lAdvertiserID
	order by lbusHourid
 
	RETURN  Left(@ConcaText,2000)
END 
GO
