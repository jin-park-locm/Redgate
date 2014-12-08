SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusVideoN]
	@lBusVideoInfoId			 int
	,@lMemberID					 varchar(100)
AS
SET NOCOUNT ONDECLARE  @lBusVideoXmlTagId			int		,@lBusVideoAddressId		int		,@lBusVideoXmlTagElementId	int		,@Error						intSELECT 
	 @lBusVideoXmlTagId			= t.lBusVideoXmlTagId
	,@lBusVideoAddressId		= a.lBusVideoAddressId
--	,@lBusVideoXmlTagElementId	= e.lBusVideoXmlTagElementId
FROM tblLP_BusVideoInfo i
JOIN tblLP_BusVideoAddress a		ON a.lBusVideoInfoId	= i.lBusVideoInfoId
JOIN tblLP_BusVideoXmlTag  t		ON t.lBusVideoAddressId = a.lBusVideoAddressId
JOIN tblLP_BusVideoXmlTagElement e	ON e.lBusVideoXmlTagId  = t.lBusVideoXmlTagId
WHERE i.lBusVideoInfoId = @lBusVideoInfoId

BEGIN TRAN

--DELETE FROM tblLP_BusVideoXmlTagElement
--WHERE lBusVideoXmlTagId = @lBusVideoXmlTagId
SELECT @Error = @@ERROR

update dbo.tblLP_BusVideoXmlTagElement
set dtActiveEnd = getdate()
		,dtUpdate = getdate()
		,szUpdatedBy = @lMemberID
from dbo.tblLP_BusVideoXmlTagElement
WHERE lBusVideoXmlTagId = @lBusVideoXmlTagId

SELECT @Error = @@ERROR

--DELETE FROM tblLP_BusVideoXmlTag
--WHERE lBusVideoAddressId = @lBusVideoAddressId
--SELECT @Error = @Error+@@ERROR

update dbo.tblLP_BusVideoXmlTag
set dtActiveEnd = getdate()
		,dtUpdate = getdate()
		,szUpdatedBy = @lMemberID
from dbo.tblLP_BusVideoXmlTag
WHERE lBusVideoAddressId = @lBusVideoAddressId

SELECT @Error = @Error+@@ERROR

--DELETE FROM tblLP_BusVideoAddress 
--WHERE lBusVideoInfoId = @lBusVideoInfoId
--SELECT @Error = @Error+@@ERROR

update dbo.tblLP_BusVideoAddress
set dtActiveEnd = getdate()
		,dtUpdate = getdate()
		,szUpdatedBy = @lMemberID
from dbo.tblLP_BusVideoAddress
WHERE lBusVideoInfoId = @lBusVideoInfoId

SELECT @Error = @Error+@@ERROR

--DELETE FROM tblLP_BusVideoInfo 
--WHERE lBusVideoInfoId = @lBusVideoInfoId
--SELECT @Error = @Error+@@ERROR

update dbo.tblLP_BusVideoInfo 
set dtActiveEnd = getdate()
	,dtUpdate = getdate()
	,szUpdatedby = @lMemberID
from dbo.tblLP_BusVideoInfo 
WHERE lBusVideoInfoId = @lBusVideoInfoId

SELECT @Error = @Error+@@ERROR

IF @Error <> 0
BEGIN
	SELECT @lBusVideoInfoId as lBusVideoInfoId
	ROLLBACK TRAN
END
ELSE 
	COMMIT TRAN
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideoN] TO [web_user]
GO
