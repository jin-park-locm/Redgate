SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_DEL_BusHourN] 
		@lBusHourID	int
AS
SET NOCOUNT ON

update dbo.tblLP_BusHour
set sActive = 'N'
	,dtUpdate = getdate()
from dbo.tblLP_BusHour
where lBusHourID = @lBusHourID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusHourN] TO [web_user]
GO
