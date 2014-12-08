SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure  [dbo].[usp_LC_UPD_Deactivate_PartnerSite]   
	@lMemberID  int,
 	@lSiteID	int
as
SET NOCOUNT ON

DECLARE @ERR int
BEGIN TRAN
	UPDATE  o
		SET  o.dtEnd	= Getdate()
			,o.sActive = 'D' 
			 
	FROM	tblLP_ProductOrder		o	
	JOIN	tblLP_ProductCampaign	c	ON  c.lCIDNo	= o.lCIDNo 
	JOIN    tblLP_PartnerSite		s	ON  s.lSiteID	= c.lSiteID
	WHERE	s.lSiteID = @lSiteID
	AND     s.sActive = 'Y'
	AND		s.sSiteType = 'PS' 
	AND		o.dtEnd  IS NULL
	SELECT @ERR = @@ERROR 
 
	UPDATE  i
		SET  i.sActive = 'D',
			 i.dtUpdate = Getdate(),
			 i.dtEnd = getdate()

	FROM	tblLP_MemberInfo		i
	JOIN	tblLP_PartnerSiteMember	m	ON m.lMemberID = i.lMemberID
	WHERE	m.lSiteID = @lSiteID
	AND     i.sActive = 'Y'
	AND		m.sSiteType = 'PS'
--	AND		m.lMemberID  = @lMemberID
	SELECT @ERR = @ERR+@@ERROR

	UPDATE	s
	SET		s.sActive = 'N',
			s.dtUpdate = getdate(),
			s.dtEnd = getdate()
	FROM tblLP_PartnerSite s		 
	WHERE	s.lSiteID = @lSiteID
	AND    s.sActive= 'Y'
	--AND		s.sSiteType = 'PS' -- mod by Linh to support deactivating PartnerPartnerSite
	SELECT @ERR = @ERR+@@ERROR


IF @ERR = 0
BEGIN
COMMIT TRAN
SELECT	@lSiteID	AS lSiteID
	   
END
ELSE ROLLBACK TRAN

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_PartnerSite] TO [web_user]
GO
