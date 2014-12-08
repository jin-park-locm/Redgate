SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_County_byZipcode]
@ZipCode	char(5)
AS
--  usp_LP_GET_County_byZipcode   '92612'
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE @county varchar(6)

	SELECT	 @county =  c.[szLocationName]

	FROM tblAL_Location			l
	JOIN glb_tbl_Location		g		ON	l.szLocationName	= g.City and l.State = g.State
	JOIN tblAL_StateCounty		c 		ON	c.lStateCountyID = l.lStateCountyID 
	WHERE g.zipcode	=   @zipcode
 
SELECT @county AS county
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_County_byZipcode] TO [web_user]
GO
