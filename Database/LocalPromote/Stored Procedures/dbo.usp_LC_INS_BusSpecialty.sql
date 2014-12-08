SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_INS_BusSpecialty]

@lAdvertiserID		int,	
@szSpecialtyDesc	varchar(3000)

AS
SET NOCOUNT ON
DECLARE @lSpecialtyID int

-- modify by MU
INSERT INTO tblLP_BusSpecialty
	(lAdvertiserID, szSpecialtyDesc, sActive, szUpdatedBy,dtUpdate)
VALUES
	(@lAdvertiserID, @szSpecialtyDesc, 'Y', 'UI', Getdate())

SET @lSpecialtyID = SCOPE_IDENTITY()

IF @@ERROR = 0
SELECT @lSpecialtyID AS lSpecialtyID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusSpecialty] TO [web_user]
GO
