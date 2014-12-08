SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--GetConcaService
CREATE FUNCTION [dbo].[GetConcaService]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+', ', '') + ISNULL(szServiceOfferDesc, '')
	FROM	tblLP_BusServiceOffered 
	WHERE   lAdvertiserID=@lAdvertiserID 
	and		sActive='Y'
	RETURN  left(@ConcaText,2000)
END 
GO
