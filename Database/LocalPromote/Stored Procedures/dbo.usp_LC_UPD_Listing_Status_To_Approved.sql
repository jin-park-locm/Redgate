SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[usp_LC_UPD_Listing_Status_To_Approved]
@lAdvertiserID	int,
@sAction		char(3)			 = 'APV',
@dtAction		datetime		 = null

AS
SET NOCOUNT ON

-- PK lAdvertiserID
  
BEGIN
	 
	UPDATE b
			SET	
			sAction			=	ISNULL (@sAction , 'UPD' ),
			dtAction		=	ISNULL (@dtAction ,Getdate() )
	FROM  tblLP_BusListing b
	WHERE lAdvertiserID = @lAdvertiserID

	IF @@ERROR = 0
	SELECT @lAdvertiserID AS lAdvertiserID

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_Status_To_Approved] TO [web_user]
GO
