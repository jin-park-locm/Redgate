SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BusAssociation]
@lBusAssociationID		int,
@lAssociationType		int			= NULL,	
@lAdvertiserID			int			= NULL,
@szAssociationOther		varchar(60)	= NULL
, @sActive				char(1)		= 'Y'
, @szUpdatedBy			varchar(20)	= 'UI'
, @dtUpdate				datetime    = NULL
AS

SET NOCOUNT ON
-- PK lBusAssociationID

update b
set lAssociationType	= ISNULL (@lAssociationType, lAssociationType)
,	lAdvertiserID		= ISNULL (@lAdvertiserID, lAdvertiserID)
,	szAssociationOther	= ISNULL (@szAssociationOther, szAssociationOther)
,	sActive				= ISNULL (@sActive, sActive)
,	szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy)
,	dtUpdate			= ISNULL (@dtUpdate, Getdate())

FROM tblLP_BusAssociation b
WHERE lBusAssociationID = @lBusAssociationID

IF @@ERROR = 0
SELECT @lBusAssociationID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusAssociation] TO [web_user]
GO
