SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_LC_GET_VerifyEmailLogin] (
	@szLoginEmail	Varchar(150)
,	@szPassword		Varchar(50)
) AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
SET NOCOUNT ON
	
BEGIN

	SELECT
		MS.lMemberID 
	,	szpassword
	,	lSecurityLevelID
	,	szLastName
	,	szFirstName
	,	szLoginName
	,	szLoginEmail 
	,	MS.dtUpdate
	,	MI.sActive
	,	P.lPartnerID 
	FROM	dbo.tblLP_MemberSecurity	MS
	INNER
	JOIN	dbo.tblLP_MemberInfo		MI
	ON		MS.lMemberID				= MI.lMemberID
	LEFT
	JOIN	dbo.tblLP_PartnerSiteMember	PM	
	ON		PM.lMemberID				= MI.lMemberID
	LEFT
	JOIN	dbo.tblLP_PartnerSite		S
	ON		S.lSiteID					= PM.lSiteID
	LEFT
	JOIN	dbo.tblLP_Partner			P
	ON		P.lPartnerID				= S.lPartnerID 
	WHERE	szLoginEmail				= @szLoginEmail
	and		szpassword					= @szPassword
	and		MI.sActive					= 'Y'
	and		MS.sActive					= 'Y'

END

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyEmailLogin] TO [web_user]
GO
