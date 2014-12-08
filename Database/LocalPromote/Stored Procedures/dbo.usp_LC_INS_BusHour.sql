SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusHour]

@lAdvertiserID int,
@s24Hr char(1),
@sHideHr char(1),
@sHourType char(2),
@sDayOfWeek char(3),
@szOpenHour varchar(8),
@szCloseHour varchar(8),
@szComment varchar(250)

AS
SET NOCOUNT ON
DECLARE @lBusHourID int

INSERT INTO tblLP_BusHour
	(lAdvertiserID, s24Hr, sHideHr, sHourType, sTimeZoneCode, sDayOfWeek, szOpenHour, szCloseHour, szComment, sActive, dtUpdate)
VALUES
	(@lAdvertiserID, @s24Hr, @sHideHr, @sHourType, 'NA', @sDayOfWeek, @szOpenHour, @szCloseHour, @szComment, 'Y', Getdate())

SET @lBusHourID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT @lBusHourID AS lBusHourID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusHour] TO [web_user]
GO
