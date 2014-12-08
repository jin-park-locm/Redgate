SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE      function [dbo].[ufn_LPGetAdditionalBusHour]
/**********************************************************************************
Description   :   ufn_LPGetAdditionalBusHour

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development

**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)

    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull(szBusHour,'')	
	FROM	(select	top 1 lAdvertiserID, 
			        case when ltrim(rtrim(isnull(szComment, ''))) = '' then ''
					else isNull(szComment,'') end
				as szBusHour				
			 from	tblLP_BusHour where sActive='Y' and lAdvertiserID=@lAdvertiserID 
			)	as BusHour
	RETURN  Left(@ConcaText,2000)
END 

GO
