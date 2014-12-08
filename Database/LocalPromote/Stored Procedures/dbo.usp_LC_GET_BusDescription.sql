SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_BusDescription]

@lAdvertiserID int 

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

SET NOCOUNT ON

SELECT 

	--[lAdvertiserID],
	[szBusDesc]
FROM  [dbo].[tblLP_BusDescription] 
WHERE [lAdvertiserID] = @lAdvertiserID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_BusDescription] TO [web_user]
GO
