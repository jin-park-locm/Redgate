SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[usp_LC_INS_PartnerSiteBillingType]
(
	 @PartnerSiteID INT
	,@BillingTypeID INT
	,@CreatedBy VARCHAR(50)

)
AS

DECLARE @ID INT
INSERT INTO [tblLP_PartnerSiteBillingType]
(
	 [PartnerSiteID]
	,[BillingTypeID]
	,[Created]
	,[CreatedBy]
)
VALUES
(
	 @PartnerSiteID
	,@BillingTypeID
	,GETDATE()
	,@CreatedBy
)
SELECT @ID = SCOPE_IDENTITY()

UPDATE tblLP_PartnerSite
SET PartnerSiteBillingTypeID = @ID
WHERE lSiteID = @PartnerSiteID




GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteBillingType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteBillingType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteBillingType] TO [web_user]
GO
