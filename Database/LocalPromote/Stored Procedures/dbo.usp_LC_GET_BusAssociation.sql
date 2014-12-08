SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_BusAssociation]

@lAdvertiserID	int

AS
SET NOCOUNT ON

SELECT
	ba.lBusAssociationID,
	ba.lAssociationType,
	ba.szAssociationOther,
	bat.szAssociationName
FROM 
	tblLP_BusAssociation ba
JOIN 
	tblLP_BusAssociationType bat 
ON	bat.lAssociationType = ba.lAssociationType
WHERE
    ba.lAdvertiserID = @lAdvertiserID
AND	ba.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusAssociation] TO [web_user]
GO
