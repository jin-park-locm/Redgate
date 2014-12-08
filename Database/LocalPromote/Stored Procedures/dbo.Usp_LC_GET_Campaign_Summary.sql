SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_Campaign_Summary]
@lMemberID int
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
 /*
EXEC [usp_LC_GET_Campaign_Summary] 323054
EXEC [usp_LC_GET_Campaign_Summary] 175505
EXEC [usp_LC_GET_Campaign_Summary] 170550
*/
DECLARE      
@security int      -- Member Security Level  
  
  

SELECT @security = lSecurityLevelID
FROM tblLP_MemberSecurity   
WHERE lMemberID = @lMemberID 
 

IF @security = 5
BEGIN 

SELECT lCIDNo, szSpecialName, mSpecialPrice, lSiteID, pc.lProductID, sDefault, pl.szProductName  
	FROM  [dbo].[tblLP_ProductCampaign] pc
	 AND pl.lPartnerID = 0
	 ORDER by szSpecialName
END

IF @security = 4
BEGIN

SELECT lCIDNo, szSpecialName, mSpecialPrice, lSiteID, pc.lProductID, sDefault, pl.szProductName
	FROM  [dbo].[tblLP_ProductCampaign] pc
	 AND pl.lPartnerID = 0
	 ORDER by szSpecialName 
END

IF @security = 3
BEGIN
SELECT lCIDNo, szSpecialName, mSpecialPrice, lSiteID, pc.lProductID, sDefault, pl.szProductName
	FROM  [dbo].[tblLP_ProductCampaign] pc
	 AND pl.lPartnerID = 0
	 ORDER by szSpecialName 
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Campaign_Summary] TO [web_user]
GO