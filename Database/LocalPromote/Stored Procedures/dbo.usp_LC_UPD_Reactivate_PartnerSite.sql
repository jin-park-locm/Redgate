SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure  [dbo].[usp_LC_UPD_Reactivate_PartnerSite]   
	@lMemberID  int,
 	@lSiteID	int
as
SET NOCOUNT ON

DECLARE @ERR int
BEGIN TRAN


 
	UPDATE  i
		SET  i.sActive= 'Y',
			 i.dtUpdate = Getdate(),
			 i.dtEnd = NULL

	FROM	tblLP_MemberInfo		i
	JOIN	tblLP_PartnerSiteMember	m	ON m.lMemberID = i.lMemberID
	WHERE	m.lSiteID = @lSiteID
	AND     i.sActive = 'D'
	AND		m.sSiteType = 'PS'
--	AND		m.lMemberID  = @lMemberID
	SELECT @ERR = @@ERROR 

	UPDATE	s
	SET		s.sActive= 'Y',
			s.dtUpdate=getdate(),
			s.dtEnd = NULL
	FROM tblLP_PartnerSite s		 
	WHERE	s.lSiteID = @lSiteID
	AND    s.sActive= 'N' -- was D, mod by Linh to support deactivating PartnerPartnerSite
	-- AND		s.sSiteType = 'PS' -- Commented out by Linh to support deactivating PartnerPartnerSite
	SELECT @ERR = @ERR+@@ERROR


IF @ERR = 0
BEGIN
COMMIT TRAN
SELECT	@lSiteID	AS lSiteID
	   
END
ELSE ROLLBACK TRAN

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_PartnerSite] TO [web_user]
GO
