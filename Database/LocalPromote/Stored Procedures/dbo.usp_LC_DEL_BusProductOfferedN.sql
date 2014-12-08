SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusProductOfferedN]     @lProductOfferID  int    ASSET NOCOUNT ON
BEGIN	UPDATE	[dbo].[tblLP_BusProductOffered]	set		sActive = 'N',			szUpdatedBy = 'UI',			dtUpdate = getdate()	WHERE lProductOfferID = @lProductOfferIDENDIF @@ERROR <> 0SELECT @lProductOfferID AS lProductOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusProductOfferedN] TO [web_user]
GO
