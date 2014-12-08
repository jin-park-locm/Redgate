SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LC_INS_CourtesyListing]     @RID			int			= NULL    ,@sAgencyID		char(2)		= NULL    ,@szTitle		varchar(150)		= NULL    ,@szAddress		varchar(100)	= NULL    ,@szCity		varchar(50)		= NULL    ,@sState		char(2)			= NULL    ,@szZip			varchar(10)		= NULL    ,@szPhone		varchar(12)		= NULL    ,@szURL			varchar(250)	= NULL    ,@sHideAddr		char(1)			= 'N'    ,@sAction		char(3)			= NULL    ,@sConfirm		char(1)			= 'N'	,@sUPDATE		varchar(50)		= NULL    ,@dtAdd		datetime			= NULL--    ,@dtTurn		datetime			= NULL	,@BDC1			int				= NULL	,@BDC2			int				= NULL      ASSET NOCOUNT ON  SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDDECLARE @lCCListingID int,		@ERR		  intSELECT @ERR = 0BEGINDELETE FROM tblCC_acxListing 
WHERE RID = @RID AND sAction = @sAction AND sConfirm <> 'T' 
	AND sAction in ('UPD', 'DEL')DELETE FROM tblCC_acxBDCWHERE RID = @RID AND sConfirm <> 'T' 
	AND sAction in ('ADD', 'DEL')    INSERT INTO [dbo].[tblCC_acxListing]    (          [RID]         ,[sAgencyID]        ,[szTitle]         ,[szAddress]         ,[szCity]         ,[sState]         ,[szZip]         ,[szPhone]         ,[szURL] 
        ,[sHideAddr]        ,[sAction]        ,[sConfirm]		,[sUpdate]		,[dtAdd]     )    VALUES    (         @RID         ,@sAgencyID        ,@szTitle         ,@szAddress         ,@szCity         ,@sState         ,@szZip         ,@szPhone 
        ,@szURL         ,@sHideAddr        ,@sAction        ,@sConfirm        ,@sUpdate		,ISNULL(@dtAdd, Getdate())    )SELECT @lCCListingID = SCOPE_IDENTITY()ENDIF @ERR = @ERR + @@ERROR /*IF ISNULL(@RID, 0) <> 0
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
*/
IF  @ERR = 0
SELECT @lCCListingID AS lCCListingID


GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing] TO [web_user]
GO
