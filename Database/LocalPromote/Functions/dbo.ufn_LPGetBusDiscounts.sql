SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE      function [dbo].[ufn_LPGetBusDiscounts]
/**********************************************************************************
Description   :   ufn_LPGetBusDiscounts

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development
01-06-2009 bwu		Added CDATA

EXAMPLES:			select dbo.ufn_LPGetBusDiscounts(72792)	

<row>Government/Military Discount</row><row>Special Discounts for Birthday Club Members</row>
<row>Discounts when you book multiple items</row><row>Midweek Specials</row>
		
<row><![CDATA[Government/Military Discount]]></row><row><![CDATA[Special Discounts for Birthday Club Members]]></row>
<row><![CDATA[Discounts when you book multiple items]]></row><row><![CDATA[Midweek Specials]]></row>

**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)
    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull('<row><![CDATA[' + szDiscountName + ']]></row>', '')	
	FROM	(select  lAdvertiserID, 
					 case when bd.lBusDiscountType=13 
						  then  szOtherDisct 
						  else  szDiscountName 
					 end  as szDiscountName
			 from	 tblLP_BusDiscount bd join 
					 tblLP_BusDiscountType bdt on bd.lBusDiscountType = bdt.lBusDiscountType
			where	bd.sActive='Y')	as BusDisc		
	WHERE   lAdvertiserID=@lAdvertiserID 

	RETURN  Left(@ConcaText,2000)
END
GO
