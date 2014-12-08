SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[usp_LC_INS_PartnerBillingType]
(
	 @PartnerID INT
	,@AllowMultipleBillingTypes BIT
	,@DefaultBillingTypeID INT
	,@CreatedBy VARCHAR(50)

)
AS

DECLARE @ID INT
INSERT INTO [tblLP_PartnerBillingType]
(
	 [PartnerID]
	,[AllowMultipleBillingTypes]
	,[DefaultBillingTypeID]
	,[Created]
	,[CreatedBy]
)
VALUES
(
	 @PartnerID
	,@AllowMultipleBillingTypes
	,@DefaultBillingTypeID
	,GETDATE()
	,@CreatedBy
)
SELECT @ID = SCOPE_IDENTITY()

UPDATE tblLP_Partner
SET PartnerBillingTypeID = @ID
WHERE lPartnerID = @PartnerID



GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerBillingType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerBillingType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerBillingType] TO [web_user]
GO
