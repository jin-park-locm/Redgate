SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_Partner_Associated_with_a_Member]

@lMemberID int 
as
SET NOCOUNT ON

SELECT
	p.lPartnerID,
	a.lMemberID, 
	a.szLoginEmail, 
	a.szPassword,
	a.sUserType,
	a.szFirstName,
	a.szLastName,
	p.szPartnerName,
	p.szPartnerLogoPath,
    p.szSSURL,
    p.sContactPhone,
    p.szPartnerEmail,
	ma.szStreeName,
	ma.szCity,
	ma.sState,
	ma.sPostalCode,
	mw.szWebURL
FROM 
	tblLP_MemberInfo a
inner join 
tblLP_PartnerSiteMember pm 
ON a.lMemberID = pm.lMemberID
inner join 
tblLP_PartnerSite  ps 
ON ps.lSiteID = pm.lSiteID
inner join 
	tblLP_Partner p 
ON p.lPartnerID = ps.lPartnerID
left join
	tblLP_MemberAddress ma
ON a.lMemberID = ma.lMemberID
left join
	tblLP_MemberWebsite mw
ON
   a.lMemberID = mw.lMemberID
WHERE 
	pm.lMemberID = @lMemberID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Associated_with_a_Member] TO [web_user]
GO
