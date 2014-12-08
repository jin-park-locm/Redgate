SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LP_GET_MFEmailStatus]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LP_GET_MFEmailStatus 394571

		
**********************************************************************************/
@lAdvertiserID		int

AS
SET NOCOUNT ON

BEGIN

select	lMFEmailID, 
		lMemberID, 
		lAdvertiserID, 
		lPartnerID, 
		lSiteID, 
		lOrderNo, 
		sAgencyId, 
		sStatus, 
		szResetURL, 
		dtUpdate, 
		sProcessed
From	tblLP_MFEmail
WHERE	sProcessed is null
AND		lAdvertiserid=@lAdvertiserid

		
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_MFEmailStatus] TO [web_user]
GO
