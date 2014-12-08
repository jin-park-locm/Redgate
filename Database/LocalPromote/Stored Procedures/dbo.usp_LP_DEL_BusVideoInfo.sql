SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS OFF
GO
--ALTER 
CREATE 
PROCEDURE [dbo].[usp_LP_DEL_BusVideoInfo]
-- --------------------------------------------------------------------------------  -- 
-- Description   :  DELETES a Listing's Video and / or Video link and Information.
--
-- These scripts may be used by the following:
--     - Web Application named Local Promote - LPAdmin.
--     - Web Application named Local.com Self Serivce website.
--
-- Change History:
-- Date     Name     Description
-- -------- -------- ------------------------------------
-- 2008-12-08 rfox    Initial Development
-- 2009-04-28 rfox	  Added tables see LCENH-324 and LPENH-220
--
-- EXAMPLE to run this sp_ usp_LP_DEL_BusVideoInfo: 	
--	exec usp_LP_DEL_BusVideoInfo @lBusVideoInfoId = 2
--
-- --------------------------------------------------------------------------------  --	

	-- TABLE tblLP_BusVideoInfo --
	@lBusVideoInfoId			INT				= NULL,
	@lAdvertiserID				INT				= NULL

AS

--SET NOCOUNT ON

BEGIN -- Begin sp_

-- BEGIN Declare vars --

	DECLARE @xlBusVideoInfoId				INT
	--DECLARE @xlBusVideoFileId				INT
	DECLARE @xlBusVideoAddressId			INT
	DECLARE @xlBusVideoXmlTagId				INT
	DECLARE @xlBusVideoUrlSansQueryStringId INT

-- END Declare vars --

-- BEGIN Set Vars --
-- END Set Vars --

IF(@lBusVideoInfoId IS NOT NULL)
BEGIN

	SET @xlBusVideoInfoId = @lBusVideoInfoId

	SELECT TOP 1
		@xlBusVideoAddressId = a.lBusVideoAddressId,
		@xlBusVideoXmlTagId = x.lBusVideoXmlTagId,
		@xlBusVideoUrlSansQueryStringId = s.lBusVideoUrlSansQueryStringId
	FROM
		(
			SELECT lBusVideoAddressId 
			FROM tblLP_BusVideoAddress 
			WHERE lBusVideoInfoId = @lBusVideoInfoId
		) a
		JOIN
			(
				SELECT lBusVideoAddressId, lBusVideoXmlTagId 
				FROM tblLP_BusVideoXmlTag 
			) x	
				ON a.lBusVideoAddressId = x.lBusVideoAddressId
			JOIN
				(
					SELECT lBusVideoXmlTagElementId, lBusVideoXmlTagId 
					FROM tblLP_BusVideoXmlTagElement 
				) e	
					ON x.lBusVideoXmlTagId = e.lBusVideoXmlTagId
				LEFT JOIN
					(
						SELECT lBusVideoUrlSansQueryStringId, lBusVideoXmlTagElementId 
						FROM tblLP_BusVideoUrlSansQueryString 
					) s	
						ON e.lBusVideoXmlTagElementId = s.lBusVideoXmlTagElementId
	ORDER BY s.lBusVideoUrlSansQueryStringId DESC -- This ORDER BY ensures the "TOP 1" is not NULL when data exists.

END
-- PRINT CAST(@xlBusVideoAddressId AS VARCHAR(20)) + ', ' + CAST(@xlBusVideoXmlTagId AS VARCHAR(20))

ELSE IF(@lAdvertiserID IS NOT NULL)
BEGIN
	SELECT TOP 1
		@xlBusVideoInfoId = i.lBusVideoInfoId,
		@xlBusVideoAddressId = a.lBusVideoAddressId,
		@xlBusVideoXmlTagId = x.lBusVideoXmlTagId,
		@xlBusVideoUrlSansQueryStringId = s.lBusVideoUrlSansQueryStringId
	FROM
	(
		SELECT lBusVideoInfoId
		FROM tblLP_BusVideoInfo
		WHERE lAdvertiserID = @lAdvertiserID
	) i
	JOIN
		(
			SELECT lBusVideoInfoId, lBusVideoAddressId 
			FROM tblLP_BusVideoAddress 
		) a
			ON i.lBusVideoInfoId = a.lBusVideoInfoId
		JOIN
			(
				SELECT lBusVideoAddressId, lBusVideoXmlTagId 
				FROM tblLP_BusVideoXmlTag 
			) x	
				ON a.lBusVideoAddressId = x.lBusVideoAddressId
			JOIN
				(
					SELECT lBusVideoXmlTagElementId, lBusVideoXmlTagId 
					FROM tblLP_BusVideoXmlTagElement 
				) e	
					ON x.lBusVideoXmlTagId = e.lBusVideoXmlTagId
				LEFT JOIN
					(
						SELECT lBusVideoUrlSansQueryStringId, lBusVideoXmlTagElementId 
						FROM tblLP_BusVideoUrlSansQueryString 
					) s	
						ON e.lBusVideoXmlTagElementId = s.lBusVideoXmlTagElementId
	ORDER BY s.lBusVideoUrlSansQueryStringId DESC -- This ORDER BY ensures the "TOP 1" is not NULL when data exists.
				
END


DELETE FROM 
	tblLP_BusVideoUrlQueryString
WHERE lBusVideoUrlSansQueryStringId = @xlBusVideoUrlSansQueryStringId

DELETE FROM 
	tblLP_BusVideoUrlSansQueryString
WHERE lBusVideoUrlSansQueryStringId = @xlBusVideoUrlSansQueryStringId

DELETE FROM 
	tblLP_BusVideoXmlTagElement
WHERE lBusVideoXmlTagId = @xlBusVideoXmlTagId

DELETE FROM 
	tblLP_BusVideoXmlTag
WHERE lBusVideoAddressId = @xlBusVideoAddressId

DELETE FROM 
	tblLP_BusVideoAddress 
WHERE lBusVideoInfoId = @xlBusVideoInfoId

DELETE FROM 
	tblLP_BusVideoInfo 
WHERE lBusVideoInfoId = @xlBusVideoInfoId

				
				
END -- End sp_
GO
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_DEL_BusVideoInfo] TO [web_user]
GO
