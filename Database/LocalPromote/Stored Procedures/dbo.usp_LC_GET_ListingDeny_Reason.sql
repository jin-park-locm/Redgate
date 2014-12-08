SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingDeny_Reason]     @lBusStatusID  int    ASSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON BEGIN    SELECT	DISTINCT 		 s.[lAdvertiserID]        ,n.[lBusStatusID]        ,n.[szStatusNote]           FROM  [dbo].[tblLP_BusListingStatusNote]	n	JOIN  [dbo].[tblLP_BusListingStatus]		s	ON s.lBusStatusID = n.lBusStatusID	WHERE  n.lBusStatusID = @lBusStatusIDEND
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingDeny_Reason] TO [web_user]
GO
