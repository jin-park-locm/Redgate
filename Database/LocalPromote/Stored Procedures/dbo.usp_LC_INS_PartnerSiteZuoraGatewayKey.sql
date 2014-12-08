SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE PROCEDURE [dbo].[usp_LC_INS_PartnerSiteZuoraGatewayKey]
(
	 @PartnerSiteID INT
	,@ZuoraKey VARCHAR(20)
	,@CreatedBy VARCHAR(50)
)
AS

DECLARE @ID INT
INSERT tblLP_PartnerSiteZuoraKey
(
	 PartnerSiteID
	,ZuoraKey
	,Created
	,CreatedBy
)
VALUES
( 
	 @PartnerSiteID
	,@ZuoraKey
	,GETDATE()
	,@CreatedBy
)
SELECT @ID = SCOPE_IDENTITY()


UPDATE tblLP_PartnerSite
SET PartnerSiteZuoraKeyID = @ID
WHERE lSiteID = @PartnerSiteID



GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteZuoraGatewayKey] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteZuoraGatewayKey] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteZuoraGatewayKey] TO [web_user]
GO
