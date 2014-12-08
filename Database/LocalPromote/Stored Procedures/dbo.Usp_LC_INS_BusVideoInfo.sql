SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_BusVideoInfo]
--@lBusVideoInfoId,
@lAdvertiserID					int			= NULL,
@lBusVideoTypeId				int			= NULL,
@lBusVideoLocationId			int			= NULL,
@szVideoTitle					varchar(100)= NULL,
@szVideoDesc					varchar(255)= NULL,
@dVideoBitRateBitsPerSec		decimal(18, 0)= NULL,
@szVideoFileName				varchar(255)= NULL,
@lVideoFramesPerSec				int			= NULL,
@dVideoFileSizeBytes			decimal(18, 0)= NULL,
@lResWidth						int			= NULL,
@lResHeight						int			= NULL,
@lDurationInSeconds				int			= NULL,
@dtVideoCreated					datetime	= NULL,
@dtVideoLastEdited				datetime	= NULL,
@dtActiveStart					datetime	= NULL,
@dtActiveEnd					datetime	= NULL,
@dtInsert						datetime	= NULL,
@szInsertedBy					varchar(100)= NULL,
@dtUpdate						datetime	= NULL,
@szUpdatedBy					varchar(100)= NULL
AS 

SET NOCOUNT ON

DECLARE @lBusVideoInfoId int

INSERT INTO tblLP_BusVideoInfo
(
	lAdvertiserID,
	lBusVideoTypeId,
	lBusVideoLocationId,
	szVideoTitle,
	szVideoDesc,
	dVideoBitRateBitsPerSec,
	szVideoFileName,
	lVideoFramesPerSec,
	dVideoFileSizeBytes,
	lResWidth,
	lResHeight,
	lDurationInSeconds,
	dtVideoCreated,
	dtVideoLastEdited,
	dtActiveStart,
	dtActiveEnd,
	dtInsert,
	szInsertedBy,
	dtUpdate,
	szUpdatedBy
)
VALUES
(
	@lAdvertiserID	,
	@lBusVideoTypeId,
	@lBusVideoLocationId,
	@szVideoTitle,
	@szVideoDesc,
	@dVideoBitRateBitsPerSec,
	@szVideoFileName,
	@lVideoFramesPerSec	,
	@dVideoFileSizeBytes,
	@lResWidth,
	@lResHeight	,
	@lDurationInSeconds	,
	@dtVideoCreated	,
	@dtVideoLastEdited,
	@dtActiveStart,
	@dtActiveEnd,
	getdate(),
	@szInsertedBy,
	@dtUpdate,
	@szUpdatedBy
)
 

IF @@ERROR = 0
SELECT @lBusVideoInfoId = SCOPE_IDENTITY()
SELECT @lBusVideoInfoId AS lBusVideoInfoId
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_BusVideoInfo] TO [web_user]
GO
