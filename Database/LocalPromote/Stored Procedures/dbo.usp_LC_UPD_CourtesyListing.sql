SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_UPD_CourtesyListing]	 @lCCListingID		int     	,@RID				int			= NULL    ,@lAdvertiserID		varchar(20)	= NULL    ,@sAgencyID			char(2)		= NULL    ,@szTitle			varchar(150)= NULL    ,@szAddress			varchar(100)= NULL    ,@szCity			varchar(50)	= NULL    ,@sState			char(2)		= NULL    ,@szZip				varchar(10)	= NULL    ,@szPhone			varchar(12)	= NULL    ,@szURL				varchar(250)= NULL    ,@sHideAddr			char(1)		= NULL    ,@sConfirm			char(1)		= NULL    ,@sUpdate			varchar(50)	= NULL	,@sAction			char(3)		= 'UPD' ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblCC_acxListing]    SET          [RID]				= ISNULL(@RID, [RID])        ,[lAdvertiserID]	= ISNULL(@lAdvertiserID, [lAdvertiserID])        ,[sAgencyID]		= ISNULL(@sAgencyID, [sAgencyID])        ,[szTitle]			= ISNULL(@szTitle, [szTitle])        ,[szAddress]		= ISNULL(@szAddress, [szAddress])        ,[szCity]			= ISNULL(@szCity, [szCity])        ,[sState]			= ISNULL(@sState, [sState])        ,[szZip]			= ISNULL(@szZip, [szZip])        ,[szPhone]			= ISNULL(@szPhone, [szPhone])        ,[szURL]			= ISNULL(@szURL, [szURL])        ,[sHideAddr]		= ISNULL(@sHideAddr, [sHideAddr])        ,[sAction]			= ISNULL(@sAction, [sAction])        ,[sConfirm]			= ISNULL(@sConfirm, [sConfirm])        ,[sUpdate]			= ISNULL(@sUpdate, [sUpdate])            WHERE [lCCListingID] = @lCCListingIDENDIF @@ERROR = 0SELECT @lCCListingID AS lCCListingID

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CourtesyListing] TO [web_user]
GO
