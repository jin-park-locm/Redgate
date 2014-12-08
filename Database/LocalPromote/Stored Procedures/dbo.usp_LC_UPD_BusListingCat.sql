SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_BusListingCat]
(
@lAdvertiserID		int,
@BDC				int,
@sPrimary			char(1)		= NULL,
@sAction			char(3)		= NULL,
@szUpdatedBy		Varchar(20) = 'UI'

)
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

UPDATE b
SET 
sPrimary	= ISNULL(@sPrimary, sPrimary),
sAction		= ISNULL(@sAction, sAction),
szUpdatedBy	= @szUpdatedBy,
dtUpdate	= Getdate()
FROM tblLP_BusListingCat b
WHERE 
lAdvertiserID	= @lAdvertiserID
AND BDC			= @BDC
 
IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID, @BDC AS BDC

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_BusListingCat] TO [web_user]
GO
