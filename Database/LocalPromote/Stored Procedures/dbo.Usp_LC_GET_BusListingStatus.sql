SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_BusListingStatus]     @lAdvertiserID			int     ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT          [lBusStatusID]        ,[lAdvertiserID]        ,[sStatus]--        ,[sLastStatus]	FROM [dbo].[tblLP_BusListingStatus]	WHERE	lAdvertiserID	=	@lAdvertiserID	AND		[sLastStatus]	=	'Y'         END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_BusListingStatus] TO [web_user]
GO
