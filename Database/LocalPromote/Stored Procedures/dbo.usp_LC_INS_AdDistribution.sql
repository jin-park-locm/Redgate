SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_AdDistribution]
	@lAdvertiserID		int,
	@lSiteID			int,
	@lOrderNo			int,
	@lAdServiceType		int,
	@sActive			char(1)		= 'Y',
	@szUpdatedBy		varchar(20) = 'UI' 	
as  
SET NOCOUNT ON  


BEGIN  
Insert into tblLP_AdDistribution 
	(	ladvertiserid,
		lSiteID,
		lOrderNo,
		lAdServiceType,
		sActive
		, szUpdatedBy
		, dtUpdate
	)
Values (
		@lAdvertiserID,
		@lSiteID,
		@lOrderNo,
		@lAdServiceType,
		@sActive,
		@szUpdatedBy,
		Getdate()
 
		)
--SD
IF @@ERROR = 0
	BEGIN 
		SELECT	 @lAdvertiserID AS lAdvertiserID
				,@lSiteID		AS lSiteID 
				,@lOrderNo		AS lOrderNo

	END
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_AdDistribution] TO [web_user]
GO
