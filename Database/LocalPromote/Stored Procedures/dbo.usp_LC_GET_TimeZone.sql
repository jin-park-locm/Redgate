SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_TimeZone]

AS
SET NOCOUNT ON

SELECT sTimeZoneCode
      ,szTimeZoneName

FROM dbo.tblAL_TimeZone (nolock)

WHERE sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_TimeZone] TO [web_user]
GO
