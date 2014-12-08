SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusListingCatN]
     @lAdvertiserID  int
    -- ,@BDC  int
    
AS
BEGIN
	
	UPDATE	[dbo].[tblLP_BusListingCat]
	SET		sAction = 'DEL',
			dtUpdate = getdate()
	WHERE	[lAdvertiserID] = @lAdvertiserID 
	--AND [BDC] = @BDC
IF @@ERROR <> 0
SELECT @lAdvertiserID AS lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusListingCatN] TO [web_user]
GO
