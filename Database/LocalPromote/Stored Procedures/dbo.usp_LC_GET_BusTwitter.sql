SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[usp_LC_GET_BusTwitter]
	@lAdvertiserID	int,
	@ShowAll char(1) = 'Y'
AS

--	Example: exec usp_LC_GET_BusTwitter @lAdvertiserID = 27

SET NOCOUNT ON

if @ShowAll = 'Y'
begin
	SELECT	
		lTwitterID,
		szTwitterName,
		sActive
	FROM 
		tblLP_BusTwitter
	WHERE
		lAdvertiserID = @lAdvertiserID 
	--	AND sActive = 'Y'
end
else
begin
	SELECT	
		lTwitterID,
		szTwitterName
	FROM 
		tblLP_BusTwitter
	WHERE
		lAdvertiserID = @lAdvertiserID 
		AND sActive = 'Y'
end

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusTwitter] TO [web_user]
GO
