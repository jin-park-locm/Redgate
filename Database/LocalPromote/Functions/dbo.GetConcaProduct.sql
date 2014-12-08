SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--GetConcaProduct
CREATE FUNCTION [dbo].[GetConcaProduct]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+', ', '') + ISNULL(szProductOfferDesc, '') 
	FROM	tblLP_BusProductOffered 
	WHERE   lAdvertiserID=@lAdvertiserID
	and		sActive = 'Y'
	RETURN  left(@ConcaText,2000)
END 
GO
