SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LP_UPD_LeadAccountInfo.sql
Description   :   Update the lead account
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
04-13-2010 dlabrie   Initial Development

<example>
usp_LP_UPD_LeadAccountInfo 405844, 2, 'N'
usp_LP_UPD_LeadAccountInfo 405844, 2, 'Y'
</example>
*****************************************************************************/

Create procedure [dbo].usp_LP_UPD_LeadAccountInfo

@AID int,
@LeadAccountID int,
@sActive char(1)


AS 
	
BEGIN

Update tblLP_LeadAccountInfo
set sActive=@sActive
Where lAdvertiserid=@AID
and lLeadAccountID=@LeadAccountID


END		


GO
GRANT EXECUTE ON  [dbo].[usp_LP_UPD_LeadAccountInfo] TO [lcssui]
GO
