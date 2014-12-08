SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_PartnerSiteMember]     @lSiteID  int    ,@lMemberID  int   ASSET NOCOUNT ON BEGIN	DELETE	FROM [dbo].[tblLP_PartnerSiteMember]	WHERE	[lSiteID]	= @lSiteID    AND		[lMemberID] = @lMemberIDIF @@ERROR <> 0SELECT	 @lSiteID	AS lSiteID  		,@lMemberID AS lMemberID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMember] TO [web_user]
GO
