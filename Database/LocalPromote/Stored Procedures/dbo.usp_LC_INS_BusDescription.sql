SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_BusDescription]

@lAdvertiserID int,
@szBusDesc varchar(4000),
@szUpdatedBy varchar(50) = 'UI'
--,@lBusDescID int OUTPUT

AS
SET NOCOUNT ON
DECLARE @lBusDescID int
-- modify by MU
INSERT INTO [dbo].[tblLP_BusDescription] 
(
	[lAdvertiserID],
	[szBusDesc],
	[szUpdatedBy],
	[dtUpdate]
) 
VALUES 
(
	@lAdvertiserID,
	@szBusDesc,
	@szUpdatedBy,
	getdate()
)
SET @lBusDescID =  SCOPE_IDENTITY()

IF @@ERROR = 0 
SELECT @lBusDescID AS lBusDescID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusDescription] TO [web_user]
GO
