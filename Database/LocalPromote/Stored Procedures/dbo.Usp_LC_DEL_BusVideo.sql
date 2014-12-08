SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusVideo]
	@lBusVideoInfoId			 int
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
DELETE FROM tblLP_BusVideoXmlTagElement
WHERE lBusVideoXmlTagId = @lBusVideoXmlTagId
SELECT @Error = @@ERROR

DELETE FROM tblLP_BusVideoXmlTag
WHERE lBusVideoAddressId = @lBusVideoAddressId
SELECT @Error = @Error+@@ERROR

DELETE FROM tblLP_BusVideoAddress 
WHERE lBusVideoInfoId = @lBusVideoInfoId
SELECT @Error = @Error+@@ERROR

DELETE FROM tblLP_BusVideoInfo 
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
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusVideo] TO [web_user]
GO
