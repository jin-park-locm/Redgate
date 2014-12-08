SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BusHour]

@lAdvertiserID	int

AS
SET NOCOUNT ON
-- Modified Mohammed 
SELECT
	b.lBusHourID,
    b.s24Hr,
    b.sHideHr,
    bt.sHourType,
	b.sTimeZoneCode,
	b.sDayOfWeek,
    b.szOpenHour,
	b.szCloseHour,
	b.szComment
FROM 
	tblLP_BusHour b
JOIN
	tblAL_BusHourType bt
ON	bt.sHourType = b.sHourType
WHERE
	b.lAdvertiserID = @lAdvertiserID
AND	b.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHour] TO [web_user]
GO
