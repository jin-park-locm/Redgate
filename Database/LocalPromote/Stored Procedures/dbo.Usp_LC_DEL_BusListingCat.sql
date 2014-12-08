SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusListingCat]
     @lAdvertiserID  int
    --,@BDC  int
    
AS
BEGIN

    DELETE FROM [dbo].[tblLP_BusListingCat]
    WHERE [lAdvertiserID] = @lAdvertiserID 
	--AND [BDC] = @BDC
IF @@ERROR <> 0
SELECT @lAdvertiserID AS lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCat] TO [web_user]
GO
