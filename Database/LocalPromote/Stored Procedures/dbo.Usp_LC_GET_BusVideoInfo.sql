SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_BusVideoInfo]
@lAdvertiserID					int			= NULL
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

SELECT DISTINCT
	i.lBusVideoInfoId,
	a.lBusVideoAddressId,
	t.lBusVideoXmlTagId,
	e.lBusVideoXmlTagElementId,
	i.lAdvertiserID,
	i.szVideoTitle,
	i.szVideoDesc,
	a.szBusVideoAddress,
	t.szXmlTag,
	e.szXmlTagElement,
	e.szXmlTagElementValue
FROM tblLP_BusVideoInfo i
JOIN tblLP_BusVideoAddress a		ON a.lBusVideoInfoId	= i.lBusVideoInfoId
JOIN tblLP_BusVideoXmlTag  t		ON t.lBusVideoAddressId = a.lBusVideoAddressId
JOIN tblLP_BusVideoXmlTagElement e	ON e.lBusVideoXmlTagId  = t.lBusVideoXmlTagId
--JOIN tblLP_BusListing b				ON b.lAdvertiserID		= i.lAdvertiserID
--JOIN tblLP_ProductOrder			o	ON b.lAdvertiserID		= o.lAdvertiserID
WHERE i.lAdvertiserID = @lAdvertiserID
AND (i.dtActiveEnd IS NULL OR i.dtActiveEnd > getdate()) 
--AND o.sActive = 'Y'
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusVideoInfo] TO [web_user]
GO
