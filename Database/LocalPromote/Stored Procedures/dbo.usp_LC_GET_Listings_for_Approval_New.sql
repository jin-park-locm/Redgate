SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--sp_helptext usp_LC_GET_Listings_for_Approval
CREATE PROCEDURE [dbo].[usp_LC_GET_Listings_for_Approval_New]  
 
@logged_in_lMemberID int  , 
@listingType         varchar(10)  = NULL
as  

/*
EXEC  [usp_LC_GET_Listings_for_Approval] 323055, 'Basic'
EXEC  [usp_LC_GET_Listings_for_Approval] 323055, 'Premium'
EXEC  [Usp_LC_GET_Listings_for_Approval] 262411 , 'Basic'
EXEC  [Usp_LC_GET_Listings_for_Approval] 78350, 'Basic'
EXEC  [Usp_LC_GET_Listings_for_Approval] 78350, 'Premium'
*/
 
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

DECLARE   
@sql varchar(8000),     -- Dynamic t-sql statement  
@security int      -- Member Security Level  
 
 
SELECT @security = lSecurityLevelID   
FROM tblLP_MemberSecurity   
WHERE lMemberID = @logged_in_lMemberID  
 
SELECT @sql = '
SELECT DISTINCT  b.lMemberID,  
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
									AND po.sActive = ''Y'') 
									THEN ''Premium''
						WHEN  (sListingType = ''FRE'' AND   pl.sActive = ''Y'')
									THEN ''Basic''
				  END,

  bs.sStatus 
 
FROM dbo.tblLP_BusListing			b  
join dbo.tblLP_MemberInfo			m	on m.lMemberID = b.lMemberID  
join dbo.tblLP_PartnerListing		pl	on pl.lAdvertiserID = b.lAdvertiserID  and pl.sActive = ''Y''
left join dbo.tblLP_ProductOrder    po  on po.lAdvertiserID = b.lAdvertiserID  and po.sActive = ''Y''
left join dbo.tblLP_ProductCampaign pc  on pc.lCIDNo = po.lCIDNo 
join dbo.tblLP_PartnerSite			ps	on ps.lSiteID = pl.lSiteID   or ps.lSiteID = pc.lSiteID 
join dbo.tblLP_Partner				p	on p.lPartnerID = ps.lPartnerID 
--join dbo.tblLP_PartnerSiteMember	pm	on  pm.lSiteID = ps.lSiteID
join dbo.tblLP_BusListingStatus		bs	on bs.lAdvertiserID = b.lAdvertiserID 
 '

DECLARE @thePartnerID int ,
		@theSiteID	  int 
   
IF @security = 1  
SELECT @sql = @sql + ' WHERE b.lMemberID = '+CONVERT(varchar(25), @logged_in_lMemberID)+ ''  

ELSE IF @security = 3   
BEGIN

-- Find the partner based on lMemberID
SELECT @thePartnerID = p.lPartnerID 
FROM tblLP_PartnerSiteMember psm 
JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
JOIN tblLP_Partner p on p.lPartnerID = ps.lPartnerID
WHERE lMemberID = @logged_in_lMemberID
	AND p.sActive = 'Y'
-- end of Find partner

SELECT @sql = @sql + ' WHERE p.lPartnerID = '+CONVERT(varchar(25), @thePartnerID)+  ''  
--SELECT @sql = @sql + ' AND pm.sSiteType = ''PT'''
END

ELSE IF @security = 4   
BEGIN

-- Find the partnersite based on lMemberID
SELECT @theSiteID = ps.lSiteID 
FROM tblLP_PartnerSiteMember psm 
JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
WHERE lMemberID = @logged_in_lMemberID
	AND ps.sActive = 'Y'
-- end of Find partnersite

SELECT @sql = @sql + ' WHERE ps.lSiteID = '+CONVERT(varchar(25), @theSiteID)+  '' 
SELECT @sql = @sql + ' AND  ps.sSiteType = ''PS'''

END

ELSE  
SELECT @sql = @sql + ' WHERE 1=1 '  
  

SELECT @sql = @sql + ' AND bs.sStatus IN( ''AWA'' , ''CFM'')
						AND bs.sLastStatus  = ''Y'''

 
IF @listingType IS NOT NULL
BEGIN

SELECT @sql = @sql + ' AND CASE	WHEN ( po.lAdvertiserID = b.lAdvertiserID AND po.sActive = ''Y'') 
								THEN ''Premium''
								WHEN  (sListingType=''FRE''	AND pl.sActive = ''Y'')
								THEN ''Basic''
								
				  END = '''+@listingType+''''
END

SELECT @sql = @sql + ' ORDER BY  szTitle  asc'  
 
 
PRINT @sql   
EXEC (@sql)







GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Listings_for_Approval_New] TO [web_user]
GO
