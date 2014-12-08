SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusListingStatus]--	 @lMemberID			int			=Null     @lAdvertiserID		int    ,@sStatus			char(3)		-- = NULL    ,@sLastStatus		char(1)		= 'Y'	    ,@sActive			char(1)		= 'Y'    ,@szUpdatedBy		varchar(20)	= 'UI'    ,@dtStatus			datetime	= NULL    AS
SET NOCOUNT ONDECLARE @lBusStatusID int BEGIN	UPDATE tblLP_BusListingStatus
	SET sLastStatus = 'N', dtStatus = getdate()
	WHERE lAdvertiserID = @lAdvertiserId 	AND sLastStatus = 'Y'    INSERT INTO [dbo].[tblLP_BusListingStatus]    (          [lAdvertiserID]        ,[sStatus]        ,[sLastStatus]        ,[sActive]        ,[szUpdatedBy]        ,[dtStatus]            )    VALUES    (         @lAdvertiserID        ,@sStatus        ,@sLastStatus        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtStatus, Getdate())            )SET @lBusStatusID = SCOPE_IDENTITY() /*UPDATE poSET sActive = 'N' ,   dtEnd   = Getdate()FROM tbllp_productorder poJOIN tblLP_PartnerListing pl ON pl.lAdvertiserID = po.lAdvertiserID WHERE po.lAdvertiserID = @lAdvertiserIDAND pl.sListingType = 'PAY'UPDATE bSET sAction = 'DNY'FROM tblLP_BusListing b WHERE b.lAdvertiserID = @lAdvertiserID*/IF @@ERROR = 0SELECT @lBusStatusID AS lBusStatusIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusListingStatus] TO [web_user]
GO
