SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [dbo].[zzusp_LC_GET_Listing_Summary]
@lMemberID int
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

/*
zzusp_LC_GET_Listing_Summary 291728
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

DECLARE  @Result Table (
						NeedsApprovalP int  ,
						NeedsApprovalB int,
						NotActiveB	   int,
						NotActiveP     int,
						ActiveB		   int,
						ActiveP		   int			
						)


SELECT @security = lSecurityLevelID  
--select * 
FROM tblLP_MemberSecurity  -- where lSecurityLevelID = 1
WHERE lMemberID = @lMemberID  
  
IF @security = 1 
BEGIN

SELECT @ToBeDeleteB = COUNT(*), @ToBeDeleteP = 0
FROM tblCC_acxListing x
JOIN tblLP_BusListing b ON b.lAdvertiserID = x.lAdvertiserID
WHERE lMemberID = @lMemberID
AND   x.sAction = 'DEL'
AND   sConfirm = 'N'

INSERT INTO @Result
SELECT NeedsApprovalP =  (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	  NeedsApprovalB =  (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	
	 NotActiveB    =   (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 NotActiveP		= (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 ActiveB       =   (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 ActiveP		= (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END)


FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
WHERE b.lMemberID = @lMemberID 
AND   s.slastStatus='Y' 
--SELECT * FROM #TEST
END

IF @security = 3 
BEGIN
SELECT @ToBeDeleteB = COUNT(*), @ToBeDeleteP = 0
FROM tblCC_acxListing x
JOIN tblLP_BusListing b ON b.lAdvertiserID = x.lAdvertiserID
JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = m.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE m.lMemberID = @lMemberID
AND   x.sAction = 'DEL'
AND   sConfirm = 'N'

INSERT INTO @Result
SELECT NeedsApprovalP =  (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	  NeedsApprovalB =  (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	
	 NotActiveB    =   (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 NotActiveP		= (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 ActiveB       =   (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 ActiveP		= (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END)

FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = m.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE m.lMemberID = @lMemberID 
AND   s.slastStatus='Y' 

END
 
IF @security = 4 
BEGIN
SELECT @ToBeDeleteB = COUNT(*), @ToBeDeleteP = 0
FROM tblCC_acxListing x
JOIN tblLP_BusListing b ON b.lAdvertiserID = x.lAdvertiserID
JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = m.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE m.lMemberID = @lMemberID
AND   e.sSiteType = 'PS'
AND   x.sAction = 'DEL'
AND   sConfirm = 'N'

INSERT INTO @Result
SELECT NeedsApprovalP =  (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	  NeedsApprovalB =  (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus IN ('AWA', 'CFM')) THEN 1 ELSE 0
							   END),

	
	 NotActiveB    =   (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 NotActiveP		= (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 ActiveB       =   (CASE WHEN  EXISTS (SELECT c.lAdvertiserID FROM tblLP_PartnerListing c
												WHERE  c.lAdvertiserID = b.lAdvertiserID AND c.dtActiveN IS NULL
												AND c.sListingType='FRE' 
												AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END),
	 ActiveP		= (CASE WHEN EXISTS (SELECT o.lAdvertiserID FROM tblLP_ProductOrder o
												JOIN tblLP_ProductCampaign c ON c.lcidno=o.lcidno
												WHERE  o.lAdvertiserID = b.lAdvertiserID
												AND s.sStatus NOT IN ('DEL', 'ICP', 'DNY', 'PND', 'DND')) THEN 1 ELSE 0
							   END)

FROM tblLP_BusListing			b
JOIN tblLP_BusListingStatus		s ON s.lAdvertiserID = b.lAdvertiserID
JOIN tblLP_PartnerSiteMember    m ON m.lMemberID     = b.lMemberID
JOIN tblLP_PartnerSite			e ON e.lSiteID		 = m.lSiteID
JOIN tblLP_Partner				r ON r.lPartnerID	 = e.lPartnerID
WHERE m.lMemberID = @lMemberID 
AND   e.sSiteType = 'PS'
AND   s.slastStatus='Y' 

END

SELECT 'Basic' as [Listing Type], sum(ActiveB) as Active, sum(NotActiveB ) as NotActive, 
		sum(NeedsApprovalB ) as [Needs Approval], ISNULL(@ToBeDeleteB,0 ) as [To be deleted],
		sum(ActiveB )+sum(NotActiveB )+sum(NeedsApprovalB )+ISNULL(@ToBeDeleteB,0 ) as
		'Total'
FROM @Result
Union all
SELECT 'Premium' as [Listing Type], sum(ActiveP) as Active, sum(NotActiveP) as NotActive, 
		sum(NeedsApprovalP) as [Needs Approval], ISNULL(@ToBeDeleteP,0) as [To be deleted],
		sum(ActiveP)+sum(NotActiveP)+sum(NeedsApprovalP)+ISNULL(@ToBeDeleteP,0) as
		'Total'
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
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [lcssui]
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[zzusp_LC_GET_Listing_Summary] TO [web_user]
GO
