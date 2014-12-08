SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_BusListingCat]
(
@lAdvertiserID		int,
@BDC				int,
@sPrimary			char(1)		= NULL,
@sAction			char(3)		= 'ADD',
@szUpdatedBy		Varchar(20) = 'UI'

)
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

INSERT INTO tblLP_BusListingCat 
(
	lAdvertiserID,
	BDC,
	sPrimary,
	sAction,
	szUpdatedBy,
	dtUpdate
)
VALUES 
(
	@lAdvertiserID,
	@BDC,
	@sPrimary,
	@sAction	,
	@szUpdatedBy,
	Getdate()
)
IF @@ERROR = 0
SELECT @lAdvertiserID as lAdvertiserID, @BDC as BDC
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_BusListingCat] TO [web_user]
GO
