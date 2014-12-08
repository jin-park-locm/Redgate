SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LC_GET_Account_Summary_Jin]
@lMemberID int
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
 
DECLARE   
@sql varchar(8000),     -- Dynamic t-sql statement  
@security int      -- Member Security Level  
 
DECLARE @pa int, @pna int, @pt int, @psa int, @psna int, @pst int

SELECT @security = lSecurityLevelID
FROM tblLP_MemberSecurity   
WHERE lMemberID = @lMemberID 
 
IF @security = 5
BEGIN

	SELECT @pa = count(*) 
	FROM tblLP_Partner (nolock)
	WHERE sActive = 'Y'

	SELECT @pna = count(*) 
	FROM tblLP_Partner (nolock) 
	WHERE sActive in ( 'N', 'D')
	 
	SELECT @pt = @pa + @pna

	SELECT @psa = count(*) 
	FROM tblLP_PartnerSite (nolock) 
	WHERE sActive = 'Y'

	SELECT @psna = count(*) 
	FROM tblLP_PartnerSite (nolock) 
	WHERE sActive in ( 'N', 'D')
	 
	SELECT @pst = @psa + @psna

SELECT  'Partner' AS 'Account Type',     @pa as 'Active', @pna 'InActive', @pt 'Total'
UNION ALL
SELECT  'PartnerSite' AS 'Account Type', @psa as 'Active', @psna as 'InActive', @pst as 'Total'

union all

select  'Advertiser' AS 'Account Type',  
   ISNULL(sum(CASE   when a.sActive = 'Y' then 1 else 0 end),0) as 'Active',  
   ISNULL(sum(CASE   when isnull(a.sActive, 'N') not in ('Y') then 1 else 0  end),0) as 'InActive',  
   count(*) as 'Total'  
from (select   DISTINCT m.lMemberID, m.sActive
		from				localpromote..tblLP_BusListing l (nolock)  
		  inner join		localpromote..tblLP_PartnerListing p (nolock)	on  l.lAdvertiserID = p.lAdvertiserID --and 
			inner join		LocalPromote..tblLP_MemberInfo m (nolock)		on  m.lMemberID = l.lMemberID  
		where EXISTS (  
							   SELECT   ps.lSiteID   
							   FROM tblLP_PartnerSiteMember pm  (nolock)
							   JOIN tblLP_PartnerSite   ps   (nolock) ON  pm.lSiteID = ps.lSiteID  
							   WHERE   ps.lSiteID = p.lSiteID
			  )  
		)  a

RETURN
END

IF @security = 3
BEGIN

SELECT
	
 'Partner' AS 'Account Type',
 ISNULL(sum(CASE   when ps.sActive = 'Y' then 1 else 0 end),0) as 'Active',
 ISNULL(sum(CASE   when ps.sActive IN( 'N','D') then 1 else 0  end),0) as 'InActive',
 count(*) as 'Total'
--SELECT   distinct ps.*
FROM tblLP_PartnerSite			ps
WHERE  ps.lPartnerID  IN (SELECT   p.lPartnerID 
						FROM tblLP_PartnerSite			ps  (nolock)
						JOIN tblLP_Partner			p (nolock) ON p.lPartnerID = ps.lPartnerID 
						JOIN tblLP_PartnerSiteMember	pm  (nolock)	ON  pm.lSiteID = ps.lSiteID
						WHERE   pm.lMemberID = @lMemberID
						)
AND sSiteType = 'PT'
UNION ALL
SELECT
	
 'PartnerSite' AS 'Account Type',
 ISNULL(sum(CASE   when ps.sActive = 'Y' then 1 else 0 end),0) as 'Active',
 ISNULL(sum(CASE   when ps.sActive IN( 'N','D') then 1 else 0  end),0) as 'InActive',
 count(*) as 'Total'
--SELECT   distinct ps.*
FROM tblLP_PartnerSite			ps
WHERE  ps.lPartnerID  IN (SELECT   p.lPartnerID 
						FROM tblLP_PartnerSite			ps  (nolock)
						JOIN tblLP_Partner			p  (nolock) ON p.lPartnerID = ps.lPartnerID 
						JOIN tblLP_PartnerSiteMember	pm (nolock)	ON  pm.lSiteID = ps.lSiteID
						WHERE   pm.lMemberID = @lMemberID
						)

union all
	select  'Advertiser' AS 'Account Type',  
	   ISNULL(sum(CASE   when a.sActive = 'Y' then 1 else 0 end),0) as 'Active',  
	   ISNULL(sum(CASE   when isnull(a.sActive, 'N') not in ('Y') then 1 else 0  end),0) as 'InActive',  
	   count(*) as 'Total'  
	from (select				DISTINCT m.lMemberID, m.sActive
			from				localpromote..tblLP_BusListing l (nolock)  
			  inner join		localpromote..tblLP_PartnerListing p (nolock)	on  l.lAdvertiserID = p.lAdvertiserID --and 
				inner join		LocalPromote..tblLP_MemberInfo m (nolock)		on  m.lMemberID = l.lMemberID  
			where EXISTS (  
								   SELECT   ps.lSiteID   
								   FROM tblLP_PartnerSiteMember pm  (nolock)
								   JOIN tblLP_PartnerSite   ps  (nolock) ON  pm.lSiteID = ps.lSiteID  
								   WHERE   pm.lMemberID = @lMemberID  
									 AND ps.lSiteID = p.lSiteID
				  )  
	)  a
END

IF @security = 4
BEGIN

SELECT
	
 'Partner' AS 'Account Type',
 ISNULL(sum(CASE   when ps.sActive = 'Y' then 1 else 0 end),0) as 'Active',
 ISNULL(sum(CASE   when ps.sActive IN( 'N','D') then 1 else 0  end),0) as 'InActive',
 count(*) as 'Total'
--SELECT   distinct ps.*
FROM tblLP_PartnerSite			ps
WHERE  ps.lSiteID IN (SELECT   ps.lSiteID 
						FROM tblLP_PartnerSite			ps  (nolock)
						--JOIN tblLP_Partner			p  ON p.lPartnerID = ps.lPartnerID 
						JOIN tblLP_PartnerSiteMember	pm  (nolock)	ON  pm.lSiteID = ps.lSiteID
						WHERE   pm.lMemberID = @lMemberID
						)
AND sSiteType = 'PT'

union all

SELECT
	
 'PartnerSite' AS 'Account Type',
 ISNULL(sum(CASE   when ps.sActive = 'Y' then 1 else 0 end),0) as 'Active',
 ISNULL(sum(CASE   when ps.sActive IN( 'N','D') then 1 else 0  end),0) as 'InActive',
 count(*) as 'Total'
--SELECT   distinct ps.*
FROM tblLP_PartnerSite			ps
WHERE  ps.lSiteID IN (SELECT   ps.lSiteID 
						FROM tblLP_PartnerSite			ps  (nolock)
						--JOIN tblLP_Partner			p  ON p.lPartnerID = ps.lPartnerID 
						JOIN tblLP_PartnerSiteMember	pm  (nolock)	ON  pm.lSiteID = ps.lSiteID
						WHERE   pm.lMemberID = @lMemberID
						)
AND sSiteType = 'PS'

union all
	select  'Advertiser' AS 'Account Type',  
	   ISNULL(sum(CASE   when a.sActive = 'Y' then 1 else 0 end),0) as 'Active',  
	   ISNULL(sum(CASE   when isnull(a.sActive, 'N') not in ('Y') then 1 else 0  end),0) as 'InActive',  
	   count(*) as 'Total'  
	from (select				DISTINCT m.lMemberID, m.sActive
			from				localpromote..tblLP_BusListing l (nolock)  
			  inner join		localpromote..tblLP_PartnerListing p (nolock)	on  l.lAdvertiserID = p.lAdvertiserID --and 
				inner join		LocalPromote..tblLP_MemberInfo m (nolock)		on  m.lMemberID = l.lMemberID  
			where EXISTS (  
								   SELECT   ps.lSiteID   
								   FROM tblLP_PartnerSiteMember pm  (nolock)
								   JOIN tblLP_PartnerSite   ps  (nolock) ON  pm.lSiteID = ps.lSiteID  
								   WHERE   pm.lMemberID = @lMemberID  
									 AND ps.lSiteID = p.lSiteID
				  )  
	)  a
END



GO
