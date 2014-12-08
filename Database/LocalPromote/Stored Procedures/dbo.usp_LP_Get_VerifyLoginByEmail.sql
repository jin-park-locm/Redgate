SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



Create PROCEDURE [dbo].[usp_LP_Get_VerifyLoginByEmail]
/**********************************************************************************
File Name     :   usp_LP_Get_VerifyLoginByEmail.sql
Description   :   Finding login level and password by email

Change History

Date       Name     Description
---------- -------- ------------------------------------
05-14-2008 dlabrie  Initial development
05-27-2008 jkang	Added DisplayName column
example       :   
	usp_LP_Get_VerifyLoginByEmail 'clientservices@local.com','LOCMpassword1'	
	usp_LP_Get_VerifyLoginByEmail 'customerservice@cnhi.com','password'
	usp_LP_Get_VerifyLoginByEmail 'Enidnews@CNHI.com','password'	
	usp_LP_Get_VerifyLoginByEmail 'Dailyiowegian@CNHI.com','password'
	usp_LP_Get_VerifyLoginByEmail 'Eagletribune@CNHI.com','password'
**********************************************************************************/
@Email	Varchar(150),
@password Varchar(50)

AS
SET NOCOUNT ON
	
 BEGIN
	Select p.lPartnerId as PartnerID, p.szPartnerName as PartnerName, ps.lSiteID as PartnerSiteID, ps.szSiteName as PartnerSiteName, a.lMemberId, szpassword, lSecurityLevelId, szLastName, szFirstName, c.szDisplayName,a.dtUpdate,
	b.sActive
	From tblLP_MemberSecurity a (nolock)
	Inner Join tblLP_MemberInfo b (nolock)
	On a.lMemberId = b.lMemberId
	Left Join tblRW_UserInfo c (nolock)
	on b.lMemberId = c.lMemberId
	left join tblLP_PartnersiteMember pm (nolock)
	on a.lMemberId = pm.lMemberId
	Left Join tblLP_Partnersite ps
	on pm.lsiteid=ps.lsiteid
	left join tblLP_Partner p (nolock)
	on ps.lPartnerId = p.lPartnerId
	Where szLoginEmail = @Email
	and	szpassword=@password

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_Get_VerifyLoginByEmail] TO [web_user]
GO
