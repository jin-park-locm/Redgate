SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--GetConcaBusDisc
CREATE FUNCTION [dbo].[GetConcaBusDisc]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+'<LI>', '') + isNull(szDiscountName,'')	
	FROM	(select  lAdvertiserID, 
					 case when bd.lBusDiscountType=13 
						  then  szOtherDisct 
						  else  szDiscountName 
					 end  as szDiscountName
			 from	 tblLP_BusDiscount bd join 
					 tblLP_BusDiscountType bdt on bd.lBusDiscountType = bdt.lBusDiscountType
			where	bd.sActive='Y')	as BusDisc		
	WHERE   lAdvertiserID=@lAdvertiserID 

	RETURN  Left('<LI>' + @ConcaText,2000)
END 


GO
