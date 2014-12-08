SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--select * from tblLP_MemberSecurity where  lMemberID = 323321
CREATE PROC [dbo].[usp_LC_GET_Listing_Summary_New]
@lMemberID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

/* 
usp_LC_GET_Listing_Summary 323321
go
usp_LC_GET_Listing_Summary 95544
*/
DECLARE @security int

DECLARE 
@ToBeDeleteB int, 
@ToBeDeleteP int 
--@NotActiveP int,
--@NotActiveB int,
--@ActiveP	int,
--@ActiveB	int,
--@NeedsApprovalP int,
--@NeedsApprovalB int

DECLARE @thePartnerID int ,
		@theSiteID	  int

DECLARE  @Result Table (
						NeedsApprovalP int  ,
						NeedsApprovalB int,
						NotActiveB	   int,
						NotActiveP     int,
						ActiveB		   int,
						ActiveP		   int
						)

INSERT INTO @Result  
SELECT 0, 0, 0, 0, 0, 0
SELECT @security = lSecurityLevelID  
--select * 
FROM tblLP_MemberSecurity  -- where lSecurityLevelID = 1
WHERE lMemberID = @lMemberID  
  
IF @security = 5 
BEGIN

--SELECT @ToBeDeleteB = COUNT(*), @ToBeDeleteP = 0
--FROM tblCC_acxListing x
--JOIN tblLP_BusListing b ON b.lAdvertiserID = x.lAdvertiserID
--WHERE 
----lMemberID = @lMemberID AND
--      x.sAction = 'DEL'
--AND   sConfirm = 'N'

SELECT @ToBeDeleteB = COUNT( distinct x.[lCCListingID]), @ToBeDeleteP = 0
--select *
FROM [tblCC_acxListing] x
JOIN [tblCC_acxListingNote] ln ON x.[lCCListingID] = ln.[lCCListingID]
left JOIN tblLP_PartnerListing		c ON c.lAdvertiserID = x.lAdvertiserID
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
left JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
left JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE	x.[sAction] = 'DEL'
AND		x.[sConfirm] = 'N'

INSERT INTO @Result
SELECT NeedsApprovalP =   (CASE WHEN (m.lMemberID = b.lMemberID 
										AND o.lAdvertiserID = b.lAdvertiserID 
										AND  ps.lSiteID = pc.lSiteID 
										AND  p.lPartnerID = ps.lPartnerID
										and s.sStatus IN ('AWA', 'CFM')
									  AND o.sActive = 'Y' AND s.slastStatus='Y' ) THEN 1 ELSE 0
							   END),

	  NeedsApprovalB =  (CASE WHEN  (pl.sListingType='FRE' AND pl.sActive = 'Y'
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	
	 NotActiveB    =   (CASE WHEN  (pl.sListingType='FRE' 
									AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END), 
	 NotActiveP		=  (CASE WHEN (s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END), 
	 ActiveB       =   (CASE WHEN ( pl.sListingType='FRE' 
							 AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END), 
	 ActiveP		=  (CASE WHEN (s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END) 


FROM dbo.tblLP_BusListing			b  
join dbo.tblLP_MemberInfo			m	on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing		pl	on pl.lAdvertiserID = b.lAdvertiserID  and pl.sActive = 'Y'
left join dbo.tblLP_ProductOrder    o   on o.lAdvertiserID  = b.lAdvertiserID  and o.sActive = 'Y'
left join dbo.tblLP_ProductCampaign pc  on pc.lCIDNo = o.lCIDNo 
join dbo.tblLP_PartnerSite			ps	on ps.lSiteID = pl.lSiteID   or ps.lSiteID = pc.lSiteID 
join dbo.tblLP_Partner				p	on p.lPartnerID = ps.lPartnerID 
--join dbo.tblLP_PartnerSiteMember	pm	on  pm.lSiteID = ps.lSiteID
join dbo.tblLP_BusListingStatus		s	on s.lAdvertiserID = b.lAdvertiserID 
--
--FROM tblLP_BusListing			b
--JOIN select top 1 *  from tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
--WHERE -- b.lMemberID = @lMemberID AND   
WHERE s.slastStatus='Y' 

END

IF @security = 3 
BEGIN

-- Find the partner based on lMemberID

SELECT @thePartnerID = pt.lPartnerID 
FROM tblLP_PartnerSiteMember psm 
JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
WHERE psm.lMemberID = @lMemberID
	AND pt.sActive = 'Y'

-- end of Find partner

SELECT @ToBeDeleteB = COUNT(*), @ToBeDeleteP = 0
--select *
FROM tblCC_acxListing x
JOIN [tblCC_acxListingNote] ln ON x.[lCCListingID] = ln.[lCCListingID]
JOIN tblLP_BusListing b ON b.lAdvertiserID = x.lAdvertiserID
JOIN tblLP_PartnerListing		c ON c.lAdvertiserID = b.lAdvertiserID
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID

WHERE -- m.lMemberID = @lMemberID AND
    x.sAction = 'DEL'
AND   x.sConfirm = 'N'
AND r.lPartnerID = @thePartnerID

INSERT INTO @Result (NeedsApprovalP,NotActiveP, ActiveP )
SELECT NeedsApprovalP =  (CASE WHEN s.sStatus IN ('AWA', 'CFM') THEN 1 ELSE 0
							   END),

	   NotActiveP		= (CASE WHEN s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END),

	    ActiveP		= (CASE WHEN s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END)

FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_ProductOrder         o ON o.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_ProductCampaign		c ON c.lcidno=o.lcidno
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE  
    s.slastStatus='Y' 
	AND r.lPartnerID = @thePartnerID 
	AND o.sActive = 'Y'
	AND o.dtEnd IS NULL
GROUP BY s.lAdvertiserID, s.sStatus
  
INSERT INTO @Result (NeedsApprovalB,NotActiveB, ActiveB )
SELECT 	 
	NeedsApprovalB =  (CASE WHEN     s.sStatus IN ('AWA', 'CFM') 
									THEN 1 ELSE 0
							   END),
	 NotActiveB    =   (CASE WHEN    s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')
									THEN 1 ELSE 0
							   END),
	 ActiveB       =   (CASE WHEN   s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND') 
								THEN 1 ELSE 0
							   END)

FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_PartnerListing		c ON c.lAdvertiserID = b.lAdvertiserID
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE  
	c.sListingType='FRE' AND
	c.sActive = 'Y'		 AND
    s.slastStatus='Y'	 AND
	r.lPartnerID = @thePartnerID  
END
 
IF @security = 4 
BEGIN
-- Find the partnersite based on lMemberID
SELECT @theSiteID = ps.lSiteID 
FROM tblLP_PartnerSiteMember psm 
JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
WHERE psm.lMemberID = @lMemberID
	AND ps.sActive = 'Y'

-- end of Find partnersite
--select * from [tblCC_acxListingNote] tblCC_acxListing

SELECT @ToBeDeleteB = COUNT(*), @ToBeDeleteP = 0
--select * 
FROM tblCC_acxListing x
JOIN [tblCC_acxListingNote]		ln ON x.[lCCListingID] = ln.[lCCListingID]
JOIN tblLP_BusListing			b  ON b.lAdvertiserID = x.lAdvertiserID
JOIN tblLP_PartnerListing		c ON c.lAdvertiserID = b.lAdvertiserID
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE -- m.lMemberID = @lMemberID AND
     x.sAction = 'DEL'
AND   x.sConfirm = 'N'
AND e.lSiteID = @theSiteID
AND  e.sSiteType = 'PS'

INSERT INTO @Result (NeedsApprovalP,NotActiveP, ActiveP )
SELECT NeedsApprovalP =  (CASE WHEN s.sStatus IN ('AWA', 'CFM') THEN 1 ELSE 0
							   END),

	   NotActiveP		= (CASE WHEN s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END),

	    ActiveP		= (CASE WHEN s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END)

FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_ProductOrder         o ON o.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_ProductCampaign		c ON c.lcidno=o.lcidno
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE --m.lMemberID = @lMemberID AND
    s.slastStatus='Y' 
	AND e.lSiteID = @theSiteID
   AND  e.sSiteType = 'PS'


INSERT INTO @Result (NeedsApprovalB,NotActiveB, ActiveB )
SELECT 	 
	NeedsApprovalB =  (CASE WHEN   s.sStatus IN ('AWA', 'CFM') 
									THEN 1 ELSE 0
							   END),
	 NotActiveB    =   (CASE WHEN   s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')
									THEN 1 ELSE 0
							   END),
	 ActiveB       =   (CASE WHEN   s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND') 
								THEN 1 ELSE 0
							   END)

FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_PartnerListing		c ON c.lAdvertiserID = b.lAdvertiserID
--JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = c.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE --m.lMemberID = @lMemberID AND
	c.sListingType='FRE' AND
	c.sActive = 'Y'		 AND
    s.slastStatus='Y'	 AND
	e.lSiteID = @theSiteID AND
    e.sSiteType = 'PS'
 

END

SELECT	'Basic' as [Listing Type], 
		sum(ISNULL(ActiveB,0)) as Active, sum(ISNULL(NotActiveB,0) ) as NotActive, 
		sum(ISNULL(NeedsApprovalB,0) ) as [Needs Approval], ISNULL(@ToBeDeleteB,0 ) as [To be deleted],
		sum(ISNULL(ActiveB,0) )+sum(ISNULL(NotActiveB,0) )+ISNULL(@ToBeDeleteB,0 ) as
		'Total' -- +sum(ISNULL(NeedsApprovalB,0) )
FROM @Result
Union all
SELECT	'Premium' as [Listing Type], 
		sum(ISNULL(ActiveP,0)) as Active, sum(ISNULL(NotActiveP,0)) as NotActive, 
		sum(ISNULL(NeedsApprovalP,0)) as [Needs Approval], ISNULL(@ToBeDeleteP,0) as [To be deleted],
		sum(ISNULL(ActiveP,0))+sum(ISNULL(NotActiveP,0))+ISNULL(@ToBeDeleteP,0) as
		'Total' -- +sum(ISNULL(NeedsApprovalP,0))
FROM @Result

 /*


--SELECT TOP 10 * FROM tblLP_BusListing
--SELECT TOP 10 * FROM tblLP_BusListingStatus
--SELECT TOP 10 * FROM tblLP_ProductOrder
--SELECT TOP 10 * FROM tblCC_acxListing
--SELECT TOP 10 * FROM tblCC_acxListingNote
--
--SELECT distinct sStatus FROM tblLP_BusListingStatus
--
--
--
--SELECT TOP 10 * FROM tblLP_PartnerListing
--SELECT TOP 10 * FROM tblLP_ProductOrder

*/
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_New] TO [web_user]
GO
