SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE proc [dbo].[usp_LC_GET_isListingGloballyBasic]

@lAdvertiserID int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SET NOCOUNT ON

IF EXISTS (

SELECT 1

FROM tblLP_ProductOrder 

WHERE lAdvertiserID = @lAdvertiserID

AND sActive = 'Y'

)

SELECT 'N' AS isGloballyBasic

ELSE

SELECT 'Y' AS isGloballyBasic

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_isListingGloballyBasic] TO [web_user]
GO
