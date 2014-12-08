SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_MyKeywordByAID]
/**********************************************************************************
Description   :   Get Default Campaign info for checkout

Change History

Date       Name     Description
---------- -------- ------------------------------------
11-16-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LC_GET_MyKeywordByAID 223835

		
**********************************************************************************/
@Advertiserid	int

AS
SET NOCOUNT ON

BEGIN

Select lKeywordID, lAdvertiserid, szKeyword, sActive, szUpdatedBy, dtUpdate
from	tblLP_Advertiserkeyword
Where	lAdvertiserid=@Advertiserid


	
ENd
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_MyKeywordByAID] TO [web_user]
GO
