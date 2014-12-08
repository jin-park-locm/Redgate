SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Listing_By_ID]
    ,@ServiceCountySt2		char(2)			= NULL
    ,@Pymt_Check			char(1)			= NULL
        ,Phone 					= ISNULL(@Phone, Phone)
		,DisplayURL 			= ISNULL(@DisplayURL, DisplayURL)
        

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Listing_By_ID] TO [web_user]
GO