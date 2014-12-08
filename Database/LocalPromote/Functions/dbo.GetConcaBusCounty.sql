SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







--GetConcaBusCounty
CREATE FUNCTION [dbo].[GetConcaBusCounty]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+'<LI>', '') + isNull(szCountyName,'')	
	FROM	(select lAdvertiserID,  szCountyName
			 from	dbo.tblLP_BusServiceLocation blo join 
					dbo.tblAL_StateCounty al on blo.lStateCountyID = al.lStateCountyID
			)	as BusCounty		
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN   Left('<LI>' + @ConcaText,2000)
END 
GO
