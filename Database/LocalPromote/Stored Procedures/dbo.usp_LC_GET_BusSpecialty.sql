SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BusSpecialty]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	lSpecialtyID,
	szSpecialtyDesc
FROM 
	tblLP_BusSpecialty
WHERE
	lAdvertiserID = @lAdvertiserID 
AND sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusSpecialty] TO [web_user]
GO
