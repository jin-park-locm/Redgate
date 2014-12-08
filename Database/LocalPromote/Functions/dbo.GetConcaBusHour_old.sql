SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--GetConcaBusHour
CREATE FUNCTION [dbo].[GetConcaBusHour_old]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull(szBusHour,'')	
	FROM	(select	lAdvertiserID, 
					'<tr><td>'+sDayOfWeek+':</td><td>'+szOpenHour+' - '+ szCloseHour+'</td></tr>'  as szBusHour				
			 from	tblLP_BusHour where sActive='Y'
			)	as BusHour
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN  Left(@ConcaText,500)
END 

GO
