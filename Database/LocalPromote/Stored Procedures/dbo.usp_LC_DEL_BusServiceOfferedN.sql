SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusServiceOfferedN]     @lServiceOfferID  int    ASSET NOCOUNT ON
BEGIN		UPDATE	[dbo].[tblLP_BusServiceOffered]	set		sActive = 'N',			szUpdatedBy = 'UI',			dtUpdate = getdate()	WHERE lServiceOfferID = @lServiceOfferIDENDIF @@ERROR <> 0SELECT @lServiceOfferID AS lServiceOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusServiceOfferedN] TO [web_user]
GO
