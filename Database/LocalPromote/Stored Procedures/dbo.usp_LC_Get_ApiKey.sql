SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_Get_ApiKey]
(
	@cAPIKey VARCHAR(50)
)

AS
	SELECT 
		 apikey
		,memberid 
	FROM tbl_apiauth 
	WHERE apikey = @cAPIKey

GO
GRANT EXECUTE ON  [dbo].[usp_LC_Get_ApiKey] TO [LocalConnect]
GO
