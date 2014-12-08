SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_ListingDeny_Reason]     @lBusStatusID  int    ,@szStatusNote  varchar(500)    ,@szUpdatedBy	varchar(20) = 'UI'    ,@dtUpdate		datetime	= NULL    ASSET NOCOUNT ON BEGIN    INSERT INTO [dbo].[tblLP_BusListingStatusNote]    (          [lBusStatusID]        ,[szStatusNote]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lBusStatusID        ,@szStatusNote        ,@szUpdatedBy        ,ISNULL(@dtUpdate,Getdate())       
     )ENDIF @@ERROR = 0SELECT @lBusStatusID AS lBusStatusID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingDeny_Reason] TO [web_user]
GO
