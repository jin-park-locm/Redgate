SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusHour]
@lBusHourID			int,
@lAdvertiserID		int			= NULL,
@s24Hr				char(1)		= NULL,
@sHideHr			char(1)		= NULL,
@sHourType			char(2)		= NULL,
@sTimeZoneCode		char(4)		= 'NA',
@sDayOfWeek			char(3)		= NULL,
@szOpenHour			varchar(8)	= NULL,
@szCloseHour		varchar(8)	= NULL,
@szComment			varchar(250)= NULL
, @sActive			char(1)		= 'Y'
, @dtUpdate			datetime    = NULL
AS
SET NOCOUNT ON

-- PK lBusHourID
UPDATE b
SET  lAdvertiserID	= ISNULL (@lAdvertiserID, lAdvertiserID)
	,s24Hr			= ISNULL (@s24Hr, s24Hr) 
	,sHideHr		= ISNULL (@sHideHr, sHideHr)
	,sHourType		= ISNULL (@sHourType, sHourType)
	,sTimeZoneCode	= ISNULL (@sTimeZoneCode, sTimeZoneCode)
	,sDayOfWeek		= ISNULL (@sDayOfWeek, sDayOfWeek)
	,szOpenHour		= ISNULL (@szOpenHour, szOpenHour)
	,szCloseHour	= ISNULL (@szCloseHour, szCloseHour)
	,szComment		= ISNULL (@szComment, szComment)
,	sActive			= ISNULL (@sActive, sActive)
,	dtUpdate		= ISNULL (@dtUpdate, Getdate())
FROM tblLP_BusHour b
WHERE lBusHourID = @lBusHourID
 
IF @@ERROR = 0
SELECT @lBusHourID AS lBusHourID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusHour] TO [web_user]
GO
