SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerBillingType]
(
	@PartnerID INT
)
AS

SELECT pbt.*
FROM tblLP_Partner p
INNER JOIN tblLP_PartnerBillingType pbt ON pbt.ID = p.PartnerBillingTypeID
WHERE p.lPartnerID = @PartnerID


GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerBillingType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerBillingType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerBillingType] TO [web_user]
GO
