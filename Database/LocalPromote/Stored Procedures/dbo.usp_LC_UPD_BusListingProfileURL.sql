SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[usp_LC_UPD_BusListingProfileURL]
	@lAdvertiserID int
	,@szProfileURL varchar(250) = NULL
	,@sLPProfile char(1) = 'Y'
	,@szNonLPProfileURL varchar(250)
	,@sActive char(1) = 'Y'
	,@szUpdatedBy varchar(20) = 'API'
	,@dtUpdate datetime = NULL

AS
SET NOCOUNT ON

BEGIN 
	UPDATE [dbo].[tblLP_BusListingProfileURL]
		SET
			[lAdvertiserID] = ISNULL(@lAdvertiserID, [lAdvertiserID])
			,[szProfileURL] = ISNULL(@szProfileURL, [szProfileURL])
			,[sLPProfile] = ISNULL(@sLPProfile, [sLPProfile])
			,[szNonLPProfile] = ISNULL(@szNonLPProfileURL, [szNonLPProfile])
			,[sActive] = ISNULL(@sActive, [sActive])
			,[szUpdatedBy] = ISNULL(@szUpdatedBy, [szUpdatedBy])
			,[dtUpdate] = ISNULL(@dtUpdate, Getdate())
		WHERE [lAdvertiserID] = @lAdvertiserID 

	IF @@ERROR = 0
		BEGIN
		SELECT @lAdvertiserID AS lAdvertiserID
	END
END



GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingProfileURL] TO [web_user]
GO
