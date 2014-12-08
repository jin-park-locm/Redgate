SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusBrandOfferedN]     @lBrandOfferID  int    ASSET NOCOUNT ON
BEGIN	UPDATE	[dbo].[tblLP_BusBrandOffered]	SET		sActive = 'N',			dtUpdate = getdate()	WHERE lBrandOfferID = @lBrandOfferIDENDIF @@ERROR <> 0SELECT @lBrandOfferID AS lBrandOfferID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusBrandOfferedN] TO [web_user]
GO
