SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BusDescription]
@lBusDescID int,
@lAdvertiserID int			= NULL,
@szBusDesc varchar(4000)	= NULL,
@szUpdatedBy		varchar(20)		= 'UI', 
@dtUpdate			datetime		= NULL

AS
SET NOCOUNT ON

-- PK lBusDescID

UPDATE b
	SET		lAdvertiserID		= ISNULL (@lAdvertiserID , lAdvertiserID),
			szBusDesc			= ISNULL (@szBusDesc,szBusDesc),
			szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
			dtUpdate			= ISNULL (@dtUpdate, Getdate())

FROM tblLP_BusDescription b
WHERE lBusDescID = @lBusDescID
 
IF @@ERROR = 0
SELECT @lBusDescID AS lBusDescID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusDescription] TO [web_user]
GO
