SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_DEL_BusSpecialtyN]
		@lSpecialtyID	int

AS
SET NOCOUNT ON

update dbo.tblLP_BusSpecialty
set sActive = 'N'
	,dtUpdate = getdate()
FROM dbo.tblLP_BusSpecialty
where lSpecialtyID = @lSpecialtyID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialtyN] TO [web_user]
GO
