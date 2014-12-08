SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



/****** Object:  StoredProcedure [dbo].[usp_LC_INS_BusListingProfileURL]    Script Date: 08/11/2011 08:21:13 ******/

CREATE PROCEDURE [dbo].[usp_LC_INS_BusListingProfileURL]
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
INSERT INTO [dbo].[tblLP_BusListingProfileURL]
	( 
	[lAdvertiserID]
	,[szProfileURL]
	,[sLPProfile]
	,[szNonLPProfile]
	,[sActive]
	,[szUpdatedBy]
	,[dtUpdate] 
	)
VALUES
	(
	@lAdvertiserID
	,@szProfileURL
	,@sLPProfile
	,@szNonLPProfileURL
	,@sActive
	,@szUpdatedBy
	,getdate()
	)

IF @@ERROR = 0
	BEGIN
		SELECT @lAdvertiserID = SCOPE_IDENTITY()
		SELECT @lAdvertiserID AS lAdvertiserID
	END
END


GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingProfileURL] TO [web_user]
GO
