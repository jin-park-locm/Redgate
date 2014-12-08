SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE FUNCTION [dbo].[GetConcaBusAsso]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)

    SELECT	@ConcaText = ISNULL(@ConcaText+'<LI>', '') + isNull(szAssociationName,'')	
	FROM	(select  lAdvertiserID, 
					 case when ba.lAssociationType = 3 
						  then szAssociationOther 
						  else szAssociationName 
					 end  as szAssociationName
			 from	 tblLP_BusAssociation ba join 
					 tblLP_BusAssociationType bat on ba.lAssociationType =bat.lAssociationType
					 where ba.sActive = 'Y'
			)	as BusAsso			
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN   Left('<LI>' + @ConcaText,2000)
END 
GO
