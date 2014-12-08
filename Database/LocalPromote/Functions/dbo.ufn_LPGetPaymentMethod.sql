SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
 
 
 
 
CREATE      function [dbo].[ufn_LPGetPaymentMethod]
/**********************************************************************************
Description   :   ufn_LPGetPaymentMethod
 
Change History
 
Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development
01-06-2009 bwu                added CDATA
 
EXAMPLES:                        select dbo.ufn_LPGetPaymentMethod(72129)        
 
<row>All Other Major Credit Cards</row><row>Debit Card</row><row>Mastercard</row><row>Visa</row><row>Cash</row>
 
<row><![CDATA[All Other Major Credit Cards]]></row><row><![CDATA[Debit Card]]></row>
<row><![CDATA[Mastercard]]></row><row><![CDATA[Visa]]></row><row><![CDATA[Cash]]></row>
 
**********************************************************************************/
(
@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as
 
BEGIN 
Declare @ConcaText VARCHAR(8000)
    SELECT        @ConcaText = ISNULL(@ConcaText, '') + ISNULL('<row><![CDATA[' + szPymtDesc + ']]></row>','')
FROM        tblLP_BusPaymentMethod bp,        tblAL_PaymentType bt 
WHERE   lAdvertiserID=@lAdvertiserID 
and bp.lPymtTypeID = bt.lPymtTypeID
and bp.sActive = 'Y'
 
RETURN   Left(@ConcaText,2000)        
END
 
 
GO
