SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_PartnerSiteMember]     @lSiteID  int    ,@lMemberID  int   ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT          [lSiteID]        ,[lMemberID]        ,[sSiteType]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]	FROM [dbo].[tblLP_PartnerSiteMember]	WHERE	[lSiteID]	= @lSiteID    AND		[lMemberID] = @lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_PartnerSiteMember] TO [web_user]
GO
