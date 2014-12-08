SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  procedure [dbo].[usp_LC_UPD_CustomerServed]
@lAdvertiserID int,
@lServiceTypeID int,
@sActive			char(1)			= NULL,  -- 'Y'
@szUpdatedBy		varchar(20)		= 'UI',  
@dtUpdate			datetime		= NULL
AS
SET NOCOUNT ON

-- PK lServiceTypeID, lAdvertiserID

UPDATE b
	SET sActive				= ISNULL (@sActive, sActive), 
		szUpdatedBy			= ISNULL (@szUpdatedBy, szUpdatedBy),
		dtUpdate			= ISNULL (@dtUpdate, Getdate())
FROM  tblLP_BusCustomerServed b
WHERE lServiceTypeID = @lServiceTypeID 
AND  lAdvertiserID = @lAdvertiserID

IF @@Error = 0

SELECT  @lServiceTypeID AS lServiceTypeID, 
		@lAdvertiserID	AS lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_CustomerServed] TO [web_user]
GO
