SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_VerifyLogin]
@szLoginName	Varchar(150),
@szPassword		Varchar(50)

AS
SET NOCOUNT ON
	
BEGIN

	SELECT 	MS.lMemberID, 
			szpassword, 
			lSecurityLevelID, 
			szLastName, 
			szFirstName,
			szLoginName, 
			MS.dtUpdate,
			MI.sActive,
			p.lPartnerID 
	FROM tblLP_MemberSecurity as MS
	Inner Join tblLP_MemberInfo as MI
	ON MS.lMemberID = MI.lMemberID
	Left Join tblLP_PartnerSiteMember pm	
	ON pm.lMemberID = MI.lMemberID
	Left Join tblLP_PartnerSite s		
	ON s.lSiteID = pm.lSiteID
	Left Join tblLP_Partner p  
	ON p.lPartnerID = s.lPartnerID 

	WHERE szLoginName = @szLoginName
	and	szpassword=@szPassword
	and mi.sActive = 'Y'
	and ms.sActive ='Y'

END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_VerifyLogin] TO [web_user]
GO
