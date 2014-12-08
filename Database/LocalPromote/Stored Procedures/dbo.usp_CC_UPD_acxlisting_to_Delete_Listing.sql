SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing]
  @lCCListingID	int
, @sAction		char(3) = 'DEL'
, @sConfirm		char(1) = NULL
AS 
SET NOCOUNT ON

UPDATE a
	SET
		  sAction  = @sAction
		, sConfirm = @sConfirm
FROM tblCC_acxlisting a 
WHERE lCCListingID = @lCCListingID

IF @@ERROR = 0
SELECT @lCCListingID AS lCCListingID
GO
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_CC_UPD_acxlisting_to_Delete_Listing] TO [web_user]
GO
