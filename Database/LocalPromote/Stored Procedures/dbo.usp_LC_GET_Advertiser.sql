SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Advertiser] 
@lMemberID int
AS
SET NOCOUNT ON


BEGIN	 

	SELECT	m.lMemberId, 
			m.szLoginEmail, 
			m.szPassword, 
			m.sUserType,
			m.szLastName , 
			m.szMidName, 
			m.szFirstName, 
			m.sTermsAccepted,
			m.sActive, 
			m.dtUpdate, 
			m.szLoginName, 
			a.szStreeName, 
			a.szUnit,
			a.szCity, 
			a.sState, 
			a.sPostalCode, 
			a.lCountryID,
			a.sAdrTypeCode,
			e.szEmail, 
			e.sEmailType,
			p.sCountryCode,
			P.szPhone,
			p.szExt,			p.sPhoneType
	From tblLP_MemberInfo		m (nolock)
	Join tblLP_MemberAddress	a (nolock) On a.lMemberId = m.lMemberId
	Join tblLP_MemberEmail		e (nolock) On e.lMemberId = m.lMemberId
	Join tblLP_MemberPhone		p (nolock) On p.lMemberId = m.lMemberId
	WHERE m.lMemberId = @lMemberID
	Order By  m.lMemberId

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Advertiser] TO [web_user]
GO
