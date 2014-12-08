SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		S Naughton
-- Create date: 03-APR-2013
-- Description:	Update or insert BusListingProfileURL.  Check if the record exists; if so update, else insert.
-- =============================================
CREATE PROCEDURE [dbo].[usp_LC_UOI_BusListingProfileURL]
	@lAdvertiserID 		int
	,@szProfileURL 		varchar(250)	= NULL
	,@sLPProfile		char(1)			= 'Y'
	,@szNonLPProfileURL	varchar(250)
	,@sActive 			char(1)			= 'Y'
	,@szUpdatedBy 		varchar(20)		= 'API'
	,@dtUpdate 			datetime		= NULL
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS(SELECT lAdvertiserID FROM tblLP_BusListingProfileURL WHERE lAdvertiserID = @lAdvertiserID AND sActive = 'Y')
	BEGIN
		UPDATE [dbo].[tblLP_BusListingProfileURL]
		SET
			 [lAdvertiserID]	= ISNULL(@lAdvertiserID, [lAdvertiserID])
			,[szProfileURL]		= ISNULL(@szProfileURL, [szProfileURL])
			,[sLPProfile]		= ISNULL(@sLPProfile, [sLPProfile])
			,[szNonLPProfile]	= ISNULL(@szNonLPProfileURL, [szNonLPProfile])
			,[sActive]			= ISNULL(@sActive, [sActive])
			,[szUpdatedBy]		= ISNULL(@szUpdatedBy, [szUpdatedBy])
			,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())
		WHERE [lAdvertiserID] = @lAdvertiserID 
		IF @@ERROR = 0
		BEGIN
			SELECT @lAdvertiserID AS lAdvertiserID
		END
	END
	ELSE
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

END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UOI_BusListingProfileURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UOI_BusListingProfileURL] TO [web_user]
GO
