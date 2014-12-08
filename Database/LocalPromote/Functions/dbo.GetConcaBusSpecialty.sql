SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--GetConcaProduct
CREATE FUNCTION [dbo].[GetConcaBusSpecialty]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+', ', '') + ISNULL(szSpecialtyDesc, '') 
	FROM	tblLP_BusSpecialty 
	WHERE   lAdvertiserID=@lAdvertiserID and sActive='Y'
	RETURN  left(@ConcaText,2000)
END 
GO
