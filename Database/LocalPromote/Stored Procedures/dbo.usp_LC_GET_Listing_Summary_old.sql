SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[usp_LC_GET_Listing_Summary_old]
@lMemberID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE @security int

DECLARE 
@ToBeDeleteB int, 
@ToBeDeleteP int ,
--@NotActiveP int,
--@NotActiveB int,
--@ActiveP	int,
--@ActiveB	int,
@NeedsApprovalP int,
@NeedsApprovalB int

DECLARE @thePartnerID int ,
		@theSiteID	  int

DECLARE  @Result Table (
						NeedsApprovalP int default 0,
						NeedsApprovalB int default 0
--						NotActiveB	   int default 0,
--						NotActiveP     int default 0,
--						ActiveB		   int default 0,
--						ActiveP		   int default 0
						)

--INSERT INTO @Result  
--SELECT 0, 0, 0, 0, 0, 0

SELECT distinct  b.lMemberID,  
  p.lPartnerID,  
  ps.lSiteID ,
  p.szPartnerName,  
  ps.szSiteName,  
  m.szFirstName,  
  m.szLastName,  
  b.lAdvertiserID,  
  b.ListingID,
  b.szTitle,  
  pl.sListingType,
	ListingType = CASE	WHEN ( po.lAdvertiserID = b.lAdvertiserID 
									AND po.sActive = 'Y') 
									THEN 'Premium'
						WHEN  (sListingType = 'FRE' AND   pl.sActive = 'Y')
									THEN 'Basic'
				  END,

  bs.sStatus 
 into #results
FROM dbo.tblLP_BusListing			b  
join dbo.tblLP_MemberInfo			m	on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing		pl	on pl.lAdvertiserID = b.lAdvertiserID  and pl.sActive = 'Y'
left join dbo.tblLP_ProductOrder    po  on po.lAdvertiserID = b.lAdvertiserID  and po.sActive = 'Y'
left join dbo.tblLP_ProductCampaign pc  on pc.lCIDNo = po.lCIDNo 
join dbo.tblLP_PartnerSite			ps	on ps.lSiteID = pl.lSiteID   or ps.lSiteID = pc.lSiteID 
join dbo.tblLP_Partner				p	on p.lPartnerID = ps.lPartnerID 
--join dbo.tblLP_PartnerSiteMember	pm	on  pm.lSiteID = ps.lSiteID
join dbo.tblLP_BusListingStatus		bs	on bs.lAdvertiserID = b.lAdvertiserID 
  WHERE bs.sStatus IN( 'AWA' , 'CFM') 		AND 
		bs.sLastStatus  = 'Y' option (force order)

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
AND		x.[sConfirm] = 'N' option (force order)
 
SELECT   
	@NeedsApprovalP = (SELECT count(*) from #results where ListingType = 'Premium'),
	@NeedsApprovalB = (SELECT count(*) from #results where ListingType = 'Basic')
/*,
	 @NotActiveB    =   SUM ((CASE WHEN  (pl.sListingType='FRE' 
									AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END)), 
	 @NotActiveP		=  SUM ((CASE WHEN (s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END)), 
	 @ActiveB       =   SUM ((CASE WHEN ( pl.sListingType='FRE' 
							 AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END)), 
	 @ActiveP		=  SUM ((CASE WHEN (s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							    END))     
*/
FROM dbo.tblLP_BusListing			b  
join dbo.tblLP_MemberInfo			m	on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing		pl	on pl.lAdvertiserID = b.lAdvertiserID  and pl.sActive = 'Y'
left join dbo.tblLP_ProductOrder    o   on o.lAdvertiserID  = b.lAdvertiserID  and o.sActive = 'Y'
left join dbo.tblLP_ProductCampaign pc  on pc.lCIDNo = o.lCIDNo 
join dbo.tblLP_PartnerSite			ps	on ps.lSiteID = pl.lSiteID   or ps.lSiteID = pc.lSiteID 
join dbo.tblLP_Partner				p	on p.lPartnerID = ps.lPartnerID 
--join dbo.tblLP_PartnerSiteMember	pm	on  pm.lSiteID = ps.lSiteID
join dbo.tblLP_BusListingStatus		s	on s.lAdvertiserID = b.lAdvertiserID 
 
WHERE s.slastStatus='Y' option (force order)
 
--INSERT INTO @Result (NeedsApprovalP, NotActiveP, ActiveP, NeedsApprovalB, NotActiveB, ActiveB )
INSERT INTO @Result (NeedsApprovalP, NeedsApprovalB)
--select @NeedsApprovalP, @NotActiveP, @ActiveP, @NeedsApprovalB, @NotActiveB, @ActiveB  
select @NeedsApprovalP, @NeedsApprovalB

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
option (force order)

SELECT  
	   @NeedsApprovalP   = (SELECT count(*) from #results where ListingType = 'Premium' and lPartnerID = @thePartnerID)
/*,
	   @NotActiveP		= SUM ((CASE WHEN s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END)),

	    @ActiveP		= SUM ((CASE WHEN s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END))
*/
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
option (force order)

SELECT 	  
     @NeedsApprovalB= (SELECT count(*) from #results where ListingType = 'Basic' and lPartnerID = @thePartnerID)
/*,
	 
	 @NotActiveB    =   SUM ((CASE WHEN    s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')
									THEN 1 ELSE 0
							   END)),
	 @ActiveB       =   SUM ((CASE WHEN   s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND') 
								THEN 1 ELSE 0
							   END))
*/
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
option (force order)

--INSERT INTO @Result (NeedsApprovalP, NotActiveP, ActiveP, NeedsApprovalB, NotActiveB, ActiveB )
INSERT INTO @Result (NeedsApprovalP, NeedsApprovalB)
--select @NeedsApprovalP, @NotActiveP, @ActiveP, @NeedsApprovalB, @NotActiveB, @ActiveB  
select @NeedsApprovalP, @NeedsApprovalB

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
option (force order)

SELECT  
	   @NeedsApprovalP   = (SELECT count(*) from #results where ListingType = 'Premium' and lSiteID = @theSiteID)
/*,

	   @NotActiveP		= SUM ((CASE WHEN s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END)),

	    @ActiveP		= SUM ( (CASE WHEN s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')  THEN 1 ELSE 0
							   END))
*/
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
option (force order)

SELECT 	 
	 @NeedsApprovalB= (SELECT count(*) from #results where ListingType = 'Basic' and lSiteID = @theSiteID)
/*,

	 @NotActiveB    =   SUM((CASE WHEN   s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')
									THEN 1 ELSE 0
							   END)),
	 @ActiveB       =   SUM((CASE WHEN   s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND') 
								THEN 1 ELSE 0
							   END))
*/
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
option (force order)

--INSERT INTO @Result (NeedsApprovalP, NotActiveP, ActiveP, NeedsApprovalB, NotActiveB, ActiveB )
INSERT INTO @Result (NeedsApprovalP, NeedsApprovalB)
--select @NeedsApprovalP, @NotActiveP, @ActiveP, @NeedsApprovalB, @NotActiveB, @ActiveB  
select @NeedsApprovalP, @NeedsApprovalB

END
--SELECT * FROM   @Result

SELECT	'Basic' as [Listing Type], 
--		 (ISNULL(ActiveB,0)) as Active,  (ISNULL(NotActiveB,0) ) as NotActive, 
		 sum(ISNULL(@NeedsApprovalB,0)) as 'Total NeedsApproval',
--		 (ISNULL(ActiveB,0) )+ (ISNULL(NotActiveB,0) )+
		 sum(ISNULL(@ToBeDeleteB,0 )) as 'Total ToBeDeleted'
FROM @Result
Union all
SELECT	'Premium' as [Listing Type], 
--		(ISNULL(ActiveP,0)) as Active,  (ISNULL(NotActiveP,0)) as NotActive, 
		sum(ISNULL(@NeedsApprovalP,0)) as 'Total NeedsApproval',
--		 (ISNULL(ActiveP,0))+ (ISNULL(NotActiveP,0))+
		sum(ISNULL(@ToBeDeleteP,0)) as 'Total ToBeDeleted'
FROM @Result
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listing_Summary_old] TO [web_user]
GO
