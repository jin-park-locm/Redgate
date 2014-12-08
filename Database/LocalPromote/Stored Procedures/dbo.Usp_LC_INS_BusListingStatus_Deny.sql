SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusListingStatus_Deny]	 @lMemberID			int    ,@lAdvertiserID		int    ,@sStatus			char(3)		= NULL    ,@sLastStatus		char(1)		= 'Y'	    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(20)	= 'UI'    ,@dtStatus			datetime	= NULLASSET NOCOUNT ONDECLARE @lBusStatusID int BEGIN	UPDATE tblLP_BusListingStatus
			SET 
				sLastStatus = 'N', 
				dtStatus = Getdate()
	WHERE	lAdvertiserID	= @lAdvertiserId 	AND		sLastStatus		= 'Y'	UPDATE po			SET sActive = 'N' ,				dtEnd   = Getdate()	FROM tbllp_productorder po	JOIN	tblLP_PartnerListing pl ON pl.lAdvertiserID = po.lAdvertiserID 	WHERE	po.lAdvertiserID = @lAdvertiserID	AND		pl.sListingType = 'PAY'UPDATE bSET sAction = 'DNY'FROM tblLP_BusListing b WHERE b.lAdvertiserID = @lAdvertiserID    INSERT INTO [dbo].[tblLP_BusListingStatus]    (          [lAdvertiserID]        ,[sStatus]        ,[sLastStatus]        ,[sActive]        ,[szUpdatedBy]        ,[dtStatus]            )    VALUES    (         @lAdvertiserID        ,@sStatus        ,@sLastStatus        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtStatus, Getdate())            )SET @lBusStatusID = SCOPE_IDENTITY()  IF @@ERROR = 0SELECT @lBusStatusID AS lBusStatusIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus_Deny] TO [web_user]
GO
