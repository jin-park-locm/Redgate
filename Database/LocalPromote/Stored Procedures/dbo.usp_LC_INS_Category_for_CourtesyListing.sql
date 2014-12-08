SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_INS_Category_for_CourtesyListing]     @RID				int = NULL    ,@BDC				int    ,@sAction			char(3)	,@lCCListingID		int = NULL    ASSET NOCOUNT ON DECLARE @lCCBdcID  int 	IF @sAction LIKE 'A%' 
		set @sAction = 'ADD'

	IF @sAction LIKE 'D%' 
		set @sAction = 'DEL'

	IF @sAction LIKE 'U%' 
		set @sAction = 'UPD'BEGIN    INSERT INTO [dbo].[tblCC_acxBDC]    (          [lCCListingID]		,[RID]        ,[BDC]        ,[sAction]        ,[sUpdate]		,[sConfirm]        ,[sDBState]        ,[dtUpdate]            )    VALUES    (         @lCCListingID
		,@RID        ,@BDC        ,@sAction        ,'UI'		,'Y'        ,'NEW'        ,Getdate()            )END
IF @@ERROR = 0
BEGIN

	SELECT @lCCBdcID = SCOPE_IDENTITY()
	SELECT @lCCBdcID AS lCCBdcID
END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Category_for_CourtesyListing] TO [web_user]
GO
