SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE  PROCEDURE [dbo].[Usp_LC_GET_Search_County]
 @szLocationName	varchar(60)	= NULL
,@State				char(2)		= NULL
,@zipcode			char(5)  	= NULL
AS

IF @zipcode IS NOT NULL
BEGIN
	SELECT	DISTINCT
			 MIN(l.lLocationID) lLocationID
			,MIN(l.[lStateCountyID]) lStateCountyID
			,c.[szLocationName]
			,c.[sState]
	FROM tblAL_Location l
	JOIN glb_tbl_Location g			ON	l.State	= g.State
	JOIN tblAL_StateCounty	c		ON	c.lStateCountyID	= l.lStateCountyID
	WHERE g.zipcode	= @zipcode
	GROUP BY c.[sState], c.[szLocationName]
RETURN
END
/* Stan's version
IF (@szLocationName IS NOT NULL) AND (@State IS NOT NULL)
BEGIN
SELECT	DISTINCT
        l.lLocationID  
		,l.[lStateCountyID]
		,c.[szLocationName]
		,c.[sState]
FROM tblAL_Location l
JOIN glb_tbl_Location g			ON	l.State	= g.State
JOIN tblAL_StateCounty	c		ON	c.lStateCountyID	= l.lStateCountyID
WHERE  ( 
		 g.[City]	= @szLocationName
AND		 g.[State]	= @State 
		)
RETURN
END
*/

-- mod by Linh
IF (@szLocationName IS NOT NULL) AND (@State IS NOT NULL)
BEGIN
SELECT	--DISTINCT
        MIN(l.lLocationID) lLocationID
		,MIN(l.[lStateCountyID]) lStateCountyID
		,c.[szLocationName]
		,MIN(l.[State]) sState
FROM tblAL_Location l
--JOIN glb_tbl_Location g			ON	l.State	= g.State
JOIN tblAL_StateCounty	c		ON	c.lStateCountyID	= l.lStateCountyID
WHERE  ( 
		 --l.[szLocationName]	= 'IRVINE' AND
		 l.[State]	= @State
		)
GROUP BY c.[szLocationName]
ORDER BY c.[szLocationName]


RETURN
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_County] TO [web_user]
GO
