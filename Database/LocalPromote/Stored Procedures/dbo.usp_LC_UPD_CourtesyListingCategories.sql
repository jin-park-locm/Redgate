SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_LC_UPD_CourtesyListingCategories]     @RID			int			= NULL	,@lCCListingID	int			= NULL    ,@sAction		char(3)			= NULL	,@sConfirm		char(1)			= 'N'	,@BDC1			int				= NULL	,@BDC2			int				= NULL      ASSET NOCOUNT ON  SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDDECLARE @ERR		  intSELECT @ERR = 0IF ISNULL(@RID, 0) <> 0
BEGIN
	IF NOT EXISTS(SELECT * FROM tblCC_acxBDC WHERE RID = @RID and sDBState = 'OLD' and dtTurn is NULL)
		INSERT INTO tblCC_acxBDC
		(lCCListingID, RID, BDC, sDBState, sAction, sConfirm, sUPDATE, dtUPDATE)
		SELECT @lCCListingID, @RID, BDC, 'OLD', @sAction, @sConfirm, 'UI', getdate()
		FROM listingStoreMaster..acx_map_ListingBDC
		WHERE RID = @RID
 
	UPDATE tblCC_acxBDC SET sConfirm = '0' WHERE RID = @RID and sDBState = 'NEW' and dtTurn is NULL

END
SET @ERR = @ERR  + @@ERROR 

IF ISNULL(@BDC1, 0) <> 0
	BEGIN	
		IF NOT EXISTS (SELECT * FROM tblCC_acxBDC WHERE RID = @RID and BDC = @BDC1 and sDBState = 'NEW' and dtTurn is NULL)
			INSERT INTO tblCC_acxBDC
			(lCCListingID, RID, BDC, sDBState, sAction, sConfirm, sUPDATE, dtUPDATE)
			VALUES(@lCCListingID, @RID, @BDC1, 'NEW', @sAction, @sConfirm, 'UI', getdate())	
		ELSE 
			UPDATE  tblCC_acxBDC SET sConfirm = @sConfirm WHERE RID = @RID and BDC = @BDC1 and sDBState = 'NEW' and dtTurn is NULL

	END
SET @ERR = @ERR  + @@ERROR 

IF ISNULL(@BDC2, 0) <> 0
	BEGIN
		IF NOT EXISTS (SELECT * FROM tblCC_acxBDC WHERE RID = @RID and BDC = @BDC2 and sDBState = 'NEW' and dtTurn is NULL)
			INSERT INTO tblCC_acxBDC
			(lCCListingID, RID, BDC, sDBState, sAction, sConfirm, sUPDATE, dtUPDATE)
			VALUES(@lCCListingID, @RID, @BDC2, 'NEW', @sAction, @sConfirm, 'UI', getdate())	
		ELSE
			UPDATE  tblCC_acxBDC SET sConfirm = @sConfirm WHERE RID = @RID and BDC = @BDC2 and sDBState = 'NEW' and dtTurn is NULL

	END
SET @ERR = @ERR  + @@ERROR 
DELETE FROM tblCC_acxBDC WHERE RID = @RID and sDBState = 'NEW' and sConfirm = '0' and dtTurn is NULL
SET @ERR = @ERR  + @@ERROR 




GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListingCategories] TO [web_user]
GO
