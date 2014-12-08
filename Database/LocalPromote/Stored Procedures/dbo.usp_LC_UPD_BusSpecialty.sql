SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_UPD_BusSpecialty]
@lSpecialtyID		int,
@lAdvertiserID		int				= NULL,	
@szSpecialtyDesc	varchar(3000)	= NULL,
@sActive			char(1)			= NULL,  -- 'Y'
@szUpdatedBy		varchar(20)		= 'UI', 
@dtUpdate			datetime		= NULL
AS
SET NOCOUNT ON

-- PK lSpecialtyID
 
UPDATE b
	
	SET lAdvertiserID		= ISNULL (@lAdvertiserID, lAdvertiserID), 
		szSpecialtyDesc		= ISNULL (@szSpecialtyDesc, szSpecialtyDesc), 
		sActive				= ISNULL (@sActive, sActive), 
		szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
		dtUpdate			= ISNULL (@dtUpdate, Getdate())

FROM tblLP_BusSpecialty b
WHERE lSpecialtyID = @lSpecialtyID

IF @@ROWCOUNT = 0
SELECT @lSpecialtyID AS lSpecialtyID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusSpecialty] TO [web_user]
GO
