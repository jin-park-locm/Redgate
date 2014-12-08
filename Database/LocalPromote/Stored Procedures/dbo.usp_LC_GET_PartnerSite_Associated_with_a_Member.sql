SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member]

@lMemberID int

as
SET NOCOUNT ON

SELECT DISTINCT 
	ps.lPartnerID,
	ps.lSiteID,
	a.lMemberID, 
	a.szLoginEmail, 
	a.szPassword,
	a.sUserType,
	a.szFirstName,
	a.szLastName,
	ps.szSiteName,
    ps.sSitePhone,
    ps.szSiteEmail,
	ps.szSiteLogoPath,
    ps.szSSURL,
	at.szDistribution,
	bm.szBillingDesc,
	ma.szStreeName,
	ma.szCity,
	ma.sState,
	ma.sPostalCode,
	mw.szWebURL,
	a.sActive

FROM 
	tblLP_MemberInfo a
inner join 
	tblLP_PartnerSiteMember m
ON  m.lMemberID = a.lMemberID
inner join	tblLP_PartnerSite ps 
ON ps.lSiteID = m.lSiteID
inner join
	tblLP_MemberAddress ma
ON a.lMemberID = ma.lMemberID
inner join
	tblLP_MemberWebsite mw
ON
   a.lMemberID = mw.lMemberID
inner join
	tblLP_AdDistributionType ad
ON
	ps.lDistTypeiD = ad.lDistTypeiD
inner join
	tblLP_PartnerSiteBilling pb
ON
	ps.lSiteID = pb.lSiteID
inner join
	tblAL_BillingMethod bm
ON
	pb.lBillingID = bm.lBillingID
inner join
	tblLP_AdDistributionType at
ON
	ps.lDistTypeid = at.lDistTypeid
WHERE 
	m.lMemberID = @lMemberID
ORDER BY a.lMemberID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Associated_with_a_Member] TO [web_user]
GO
