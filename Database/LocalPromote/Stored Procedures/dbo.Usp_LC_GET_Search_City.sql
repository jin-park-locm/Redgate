SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Search_City]
 @szLocationName	varchar(60)	= NULL
,@State				char(2)		= NULL
,@zipcode			char(5)  	= NULL
AS

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


IF (@szLocationName IS NOT NULL) AND (@State IS NOT NULL)
BEGIN

	SELECT DISTINCT 
		l.lLocationID, 
		l.szLocationName as cityLocation, 
		c.szLocationName as countyLocation,
		l.State
	FROM tblAL_Location l
	JOIN (
			SELECT   
			c.lStateCountyID
			,c.[szLocationName], l.State
			FROM tblAL_Location  l
			 JOIN glb_tbl_Location  g ON  g.city   = l.szLocationName AND g.State = l.State
			 JOIN tblAL_StateCounty c ON  c.lStateCountyID = l.lStateCountyID
			WHERE g.city = @szLocationName and g.State = @State
	) c ON c.lStateCountyID = l.lStateCountyID
	AND c.State = l.State
	AND sCityCode = 'D'
RETURN
END

IF @zipcode IS NOT NULL
BEGIN
	SELECT DISTINCT 
		l.lLocationID, 
		l.szLocationName as cityLocation, 
		c.szLocationName as countyLocation,
		l.State
	FROM tblAL_Location l
	JOIN (
			SELECT   
			c.lStateCountyID
			,c.[szLocationName], l.State
			FROM tblAL_Location  l
			 JOIN glb_tbl_Location  g ON  g.city   = l.szLocationName AND g.State = l.State
			 JOIN tblAL_StateCounty c ON  c.lStateCountyID = l.lStateCountyID
			WHERE g.zipCode = @zipcode
	) c ON c.lStateCountyID = l.lStateCountyID
	AND c.State = l.State
	AND sCityCode = 'D'
RETURN
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Search_City] TO [web_user]
GO
