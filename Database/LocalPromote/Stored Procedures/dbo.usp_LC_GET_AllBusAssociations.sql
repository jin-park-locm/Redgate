SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_AllBusAssociations]
AS

SET NOCOUNT ON

SELECT
	lAssociationType,
	szAssociationName
FROM 
	tblLP_BusAssociationType
ORDER BY 
	lAssociationType
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllBusAssociations] TO [web_user]
GO
