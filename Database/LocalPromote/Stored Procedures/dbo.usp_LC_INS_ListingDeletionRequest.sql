SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_INS_ListingDeletionRequest]
@lAdvertiserID	int		= NULL,
@RID			int		= NULL,
@sAction		char(3) = 'DEL',
@sConfirm		char(1)	= NULL
--@szStatusNote  varchar(500)

AS
SET NOCOUNT ON
DECLARE @lCCListingID int
DECLARE @sActiveDB VARCHAR(16)

BEGIN

IF @lAdvertiserID IS NOT NULL
BEGIN
	INSERT INTO [tblCC_acxListing]
           ([lAdvertiserID]
           ,[szTitle]
           ,[szAddress]
           ,[szCity]
           ,[sState]
           ,[szZip]
           ,[szPhone]
           ,[szURL]
           ,[sHideAddr]
           ,[sAction]
           ,[sConfirm]
           ,[sUpdate]
           ,[dtAdd])
	SELECT 
			[lAdvertiserID]
           ,[szTitle]
           ,[szStreetName]
           ,[szCity]
           ,[sState]
           ,[sPostalCode]
           ,[szPhone]
           ,[szURL]
           ,[sHideAddress]
           ,@sAction
           ,@sConfirm
           ,'UI'
           ,getdate()
	FROM tblLP_BusListing
	WHERE lAdvertiserID = @lAdvertiserID
--RETURN
END

IF @RID IS NOT NULL
BEGIN
	SELECT @sActiveDB = activeDB FROM ListingStoreMaster..acx_ActiveListingStore
	IF @sActiveDB = 'listingstore'
	BEGIN
		INSERT INTO [tblCC_acxListing]
				([RID]
				,[szTitle]
				,[szAddress]
				,[szCity]
				,[sState]
				,[szZip]
				,[szPhone]
				,[szURL]
				,[sHideAddr]
				,[sAction]
				,[sConfirm]
				,[sUpdate]
				,[dtAdd])
		SELECT   [RID]
				,[Title]
				,[Address]
				,[City]
				,[State]
				,[ZipCode]
				,[PhoneNumber]
				,[URL]
				, 'N'
				,@sAction
				,@sConfirm
				,'UI'
				,getdate()
		FROM [ListingStore].[dbo].[acx_tbl_Listing] 
		WHERE RID = @RID
	end
	ELSE
	BEGIN
		INSERT INTO [tblCC_acxListing]
				([RID]
				,[szTitle]
				,[szAddress]
				,[szCity]
				,[sState]
				,[szZip]
				,[szPhone]
				,[szURL]
				,[sHideAddr]
				,[sAction]
				,[sConfirm]
				,[sUpdate]
				,[dtAdd])
		SELECT   [RID]
				,[Title]
				,[Address]
				,[City]
				,[State]
				,[ZipCode]
				,[PhoneNumber]
				,[URL]
				, 'N'
				,@sAction
				,@sConfirm
				,'UI'
				,getdate()
		FROM [ListingStore2].[dbo].[acx_tbl_Listing] 
		WHERE RID = @RID
	END
END


IF @@ERROR = 0
	SELECT @lCCListingID = SCOPE_IDENTITY()
	SELECT @lCCListingID AS lCCListingID
	
END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeletionRequest] TO [web_user]
GO
