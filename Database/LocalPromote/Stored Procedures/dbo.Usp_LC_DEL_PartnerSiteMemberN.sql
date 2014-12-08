SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_PartnerSiteMemberN]     @lSiteID  int    ,@lMemberID  int   ASSET NOCOUNT ON BEGIN--	DELETE--	FROM [dbo].[tblLP_PartnerSiteMember]--	WHERE	[lSiteID]	= @lSiteID--    AND		[lMemberID] = @lMemberID		update [dbo].[tblLP_PartnerSiteMember]	set sActive = 'N'		,dtUpdate = getdate()	from [dbo].[tblLP_PartnerSiteMember]	where lSiteID = @lSiteID	and lMemberID = @lMemberIDIF @@ERROR <> 0SELECT	 @lSiteID	AS lSiteID  		,@lMemberID AS lMemberID END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_PartnerSiteMemberN] TO [web_user]
GO
