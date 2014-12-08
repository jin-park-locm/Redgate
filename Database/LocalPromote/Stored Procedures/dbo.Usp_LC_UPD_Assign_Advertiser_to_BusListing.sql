SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing]
     @lAdvertiserID int
    ,@lMemberID 	int
    
AS
SET NOCOUNT ON

BEGIN

    UPDATE [dbo].[tblLP_BusListing]
    SET 
         [lMemberID]	= ISNULL(@lMemberID, [lMemberID])
        -- ,[dtUpdate]		=  Getdate()
        
    WHERE lAdvertiserID = @lAdvertiserID
END
IF @@ERROR = 0
SELECT	 @lAdvertiserID	AS lAdvertiserID 
		,@lMemberID		AS lMemberID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Assign_Advertiser_to_BusListing] TO [web_user]
GO
