SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE      function [dbo].[ufn_LPGetBusAsso]
/**********************************************************************************
Description   :   ufn_LPGetBusAsso

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-17-2008 bwu      Initial Development
01-06-2009 bwu		Added CDATA

EXAMPLES:			select dbo.ufn_LPGetBusAsso(72220)		

<row>Better Business Bureau</row><row>Chamber of Commerce</row><row>VIRGINIA ASSOCIATION OF SURVEYORS</row><row>SOUTHSIDE VIRGINIA ASSOCIATION OF REALTORS</row>

<row><![CDATA[Better Business Bureau]]></row><row><![CDATA[Chamber of Commerce]]></row>
<row><![CDATA[VIRGINIA ASSOCIATION OF SURVEYORS]]></row><row><![CDATA[SOUTHSIDE VIRGINIA ASSOCIATION OF REALTORS]]></row>


**********************************************************************************/
(
	@lAdvertiserID int
)
RETURNS VARCHAR(8000) 
as

BEGIN 
	Declare @ConcaText VARCHAR(8000)

    SELECT	@ConcaText = ISNULL(@ConcaText, '') + isNull('<row><![CDATA[' + szAssociationName + ']]></row>','')	
	FROM	(select  lAdvertiserID, 
					 case when ba.lAssociationType = 3 
						  then szAssociationOther 
						  else szAssociationName 
					 end  as szAssociationName
			 from	 tblLP_BusAssociation ba join 
					 tblLP_BusAssociationType bat on ba.lAssociationType = bat.lAssociationType
					 where ba.sActive = 'Y'
			)	as BusAsso			
	WHERE   lAdvertiserID = @lAdvertiserID 
	RETURN   Left(@ConcaText,2000)
END
GO
