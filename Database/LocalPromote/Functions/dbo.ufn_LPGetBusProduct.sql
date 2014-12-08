SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE      function [dbo].[ufn_LPGetBusProduct]
/**********************************************************************************
Description   :   ufn_LPGetBusProduct

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development

EXAMPLES:			select dbo.ufn_LPGetBusProduct(72792)			

**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+', ', '') + ISNULL(szProductOfferDesc, '') 
	FROM	tblLP_BusProductOffered 
	WHERE   lAdvertiserID=@lAdvertiserID
	and		sActive = 'Y'
	RETURN  left(@ConcaText,2000)
END 

GO
