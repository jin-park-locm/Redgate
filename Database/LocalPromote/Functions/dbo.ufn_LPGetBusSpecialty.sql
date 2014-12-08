SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE      function [dbo].[ufn_LPGetBusSpecialty]
/**********************************************************************************
Description   :   ufn_LPGetBusSpecialty

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development
01-06-2009 bwu		Modified name

EXAMPLES:			select dbo.ufn_LPGetBusSpecialty(72792)			

**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+', ', '') + ISNULL(szSpecialtyDesc, '') 
	FROM	tblLP_BusSpecialty 
	WHERE   lAdvertiserID=@lAdvertiserID 
	and		sActive='Y'
	RETURN  left(@ConcaText,2000)
END 
GO
