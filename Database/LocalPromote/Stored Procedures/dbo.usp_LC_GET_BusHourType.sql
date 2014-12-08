SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BusHourType]

AS
SET NOCOUNT ON

SELECT 
	sHourType,
	szHourDesc
FROM 
	tblAL_BusHourType
ORDER BY 
	sHourType
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusHourType] TO [web_user]
GO
