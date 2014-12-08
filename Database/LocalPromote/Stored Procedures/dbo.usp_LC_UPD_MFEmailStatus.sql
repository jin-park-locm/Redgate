SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_UPD_MFEmailStatus] (
	 @lMemberID		int		= NULL    ,@lAdvertiserID int		= NULL
    ,@lPartnerID	int		= NULL
    ,@lSiteID		int		= NULL
    ,@lOrderNo		int		= NULL
	,@sAgencyID		char(2) = NULL
    ,@sStatus		char(3)	= NULL
	,@szResetURL	varchar(250) = NULL
    ,@dtUpdate		datetime	= Null) AS/**********************************************************************************
Description   :   Mark all processed row with sProcessed='Y'

Change History

Date       Name     Description
---------- -------- ------------------------------------
12-21-2009 dlabrie    Initial Development

EXAMPLES: 	usp_LC_UPD_MFEmailStatus 4836,0,0,0,0, null, 'APS', ---- Advertiserid=0
			'http://caweblpa01/users/enterNewPassword/f4edda78c93eeda7b028befa6e182ffb','12/21/2009'
		
			usp_LC_UPD_MFEmailStatus 4836, Null, 0,0,0, null, 'APS', ---- Advertiserid=NULL
			'http://caweblpa01/users/enterNewPassword/f4edda78c93eeda7b028befa6e182ffb','12/21/2009'
			
			usp_LC_UPD_MFEmailStatus Null, 394571, 1, 2, 0, Null, 'CFM',Null, '12/21/2009'
						--Advertiserid has a value
01-09-2010	rsesser	Use GETDATE() if @dtUpdate is NULL. Return records upon successful update
**********************************************************************************/
SET NOCOUNT ONDECLARE @err INTSET @err = 0IF @lAdvertiserID IS NOT NULL or @lAdvertiserID<>0BEGINUPDATE [dbo].[tblLP_MFEmail]SET		[lMemberID]=@lMemberID
       ,[lAdvertiserID]=@lAdvertiserID
       ,[lPartnerID]=@lPartnerID
       ,[lSiteID]=@lSiteID
       ,[lOrderNo]=@lOrderNo
	   ,[sAgencyID]=@sAgencyID
       ,[sStatus]=@sStatus
       ,[dtUpdate] = ISNULL(@dtUpdate, GETDATE())	   ,[szResetURL]=@szResetURLWHERE	sProcessed is null AND		lAdvertiserid=@lAdvertiserID
	SET @err = @@ERROR

	IF @err = 0
	BEGIN
		SELECT	lMFEmailID
			,	lAdvertiserID
			,	lPartnerID
			,	lSiteID
			,	lOrderNo
			,	sAgencyID
			,	sStatus
			,	dtUpdate
			,	sProcessed
		FROM	dbo.tblLP_MFEmail
		WHERE	lAdvertiserID = @lAdvertiserID
		AND		sProcessed IS NULL
	END
END




GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_MFEmailStatus] TO [web_user]
GO
