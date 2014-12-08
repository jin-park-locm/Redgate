SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_StateList]

AS
SET NOCOUNT ON

SELECT 
	sState,
	szStName
FROM 
	tblAL_State
WHERE 
	sNoStateFlag <> 'Y'
OR	sNoStateFlag is null
ORDER BY 
	sState
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_StateList] TO [web_user]
GO
