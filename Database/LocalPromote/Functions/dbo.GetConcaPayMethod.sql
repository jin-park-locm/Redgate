SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




--GetConcaPayMethod
CREATE FUNCTION [dbo].[GetConcaPayMethod]
( 
	@lAdvertiserID int
) 
RETURNS VARCHAR(8000) 
AS 
BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText+'<LI>', '') + ISNULL(szPymtDesc,'')
	FROM	(select	lAdvertiserID, szPymtDesc
			 from	tblLP_BusPaymentMethod bp join 
					tblAL_PaymentType bt on bp.lPymtTypeID = bt.lPymtTypeID
			where bp.sActive='Y') as Pmt
	WHERE   lAdvertiserID=@lAdvertiserID 
	RETURN   Left('<LI>' + @ConcaText,2000)	
END 
GO
