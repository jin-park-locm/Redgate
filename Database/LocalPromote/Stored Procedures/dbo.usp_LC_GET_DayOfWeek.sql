SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_DayOfWeek]

AS
SET NOCOUNT ON

SELECT sDayOfWeek
      ,szDayOfWeekName

FROM dbo.tblAL_DayOfWeek (nolock)

WHERE sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_DayOfWeek] TO [web_user]
GO
