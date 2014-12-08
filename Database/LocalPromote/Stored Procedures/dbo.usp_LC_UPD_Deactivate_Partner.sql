SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure  [dbo].[usp_LC_UPD_Deactivate_Partner]  
	@lMemberID  int,
 	@lPartnerID	int
as
SET NOCOUNT ON

DECLARE @ERR int
BEGIN TRAN
	UPDATE  o
		SET  o.dtEnd	= Getdate()
			,o.sActive= 'D'

	FROM	tblLP_ProductOrder		o	
	JOIN	tblLP_ProductCampaign	c	ON  c.lCIDNo		= o.lCIDNo 
	JOIN    tblLP_PartnerSite		s	ON  s.lSiteID		= c.lSiteID
	JOIN    tblLP_Partner			p	ON  p.lPartnerID	= s.lPartnerID
--	JOIN	tblLP_PartnerSiteMember	m	ON	m.lSiteID	= s.lSiteID
	WHERE	p.lPartnerID = @lPartnerID
	AND     s.sActive = 'Y'
	AND     o.dtEnd   IS NULL
--	AND		s.sSiteType = 'PT'
--	AND		m.lMemberID  = @lMemberID
 
	SELECT @ERR = @@ERROR 
 
	UPDATE  i
		SET  i.sActive= 'D',
			 i.dtUpdate = Getdate(),
			 i.dtEnd = getdate()
 
	FROM	tblLP_MemberInfo		i
	JOIN	tblLP_PartnerSiteMember	m	ON  m.lMemberID		= i.lMemberID
	JOIN    tblLP_PartnerSite		s	ON  s.lSiteID		= m.lSiteID
	JOIN    tblLP_Partner			p	ON  p.lPartnerID	= s.lPartnerID
	WHERE	p.lPartnerID = @lPartnerID
	AND     i.sActive = 'Y'
	AND     p.sActive = 'Y'
--	AND		m.sSiteType = 'PT'
--	AND		m.lMemberID  = @lMemberID

	SELECT @ERR = @ERR+@@ERROR

	UPDATE	p
	SET		p.sActive= 'D',
			p.dtUpdate=getdate(),
			p.dtEnd = getdate()

	FROM	tblLP_Partner			p
	JOIN    tblLP_PartnerSite		s	ON  s.lPartnerID	= p.lPartnerID
--	JOIN	tblLP_PartnerSiteMember m	ON  m.lSiteID		= s.lSiteID
	WHERE	p.lPartnerID = @lPartnerID
	AND		s.sSiteType = 'PT'
	AND     p.sActive   = 'Y'
--	AND		m.lMemberID  = @lMemberID
 
	SELECT @ERR = @ERR+@@ERROR

	UPDATE	p
	SET		p.sActive= 'D',
			p.dtUpdate=getdate(),
			p.dtEnd = getdate()
		
	FROM	tblLP_PartnerSite	p
	JOIN    tblLP_Partner		s	ON  s.lPartnerID	= p.lPartnerID
--	JOIN	tblLP_PartnerSiteMember m	ON  m.lSiteID		= s.lSiteID
	WHERE	p.lPartnerID =  @lPartnerID
--	AND		p.sSiteType = 'PT'
	AND     p.sActive   = 'Y'
--	AND		m.lMemberID  = @lMemberID

	SELECT @ERR = @ERR+@@ERROR 

IF @ERR = 0
BEGIN
COMMIT TRAN
SELECT	@lPartnerID	AS lPartnerID
 
END
ELSE ROLLBACK TRAN
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Partner] TO [web_user]
GO
