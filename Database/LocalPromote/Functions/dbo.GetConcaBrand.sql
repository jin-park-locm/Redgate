SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--GetConcaBrand
CREATE FUNCTION [dbo].[GetConcaBrand]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+', ', '') + ISNULL(szBrandOfferDesc, '') 
	FROM	tblLP_BusBrandoffered 
	WHERE   lAdvertiserID=@lAdvertiserID 
	and		sActive='Y'
	RETURN  left(@ConcaText,2000)
END 
GO
