SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusAssociation]

@lAssociationType		int,	
@lAdvertiserID			int,
@szAssociationOther		varchar(60)

AS
SET NOCOUNT ON
DECLARE @lBusAssociationID int


INSERT INTO tblLP_BusAssociation
	(lAssociationType, lAdvertiserID, szAssociationOther, sActive, szUpdatedBy,dtUpdate)
VALUES
	(@lAssociationType, @lAdvertiserID, @szAssociationOther, 'Y', 'UI', Getdate())

SET @lBusAssociationID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT @lBusAssociationID AS lBusAssociationID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusAssociation] TO [web_user]
GO
