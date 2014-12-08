SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Usp_LC_UPD_PartnerSiteRadius]
BEGIN

IF EXISTS (SELECT 1 FROM [dbo].[tblLP_PartnerSiteRadius] WHERE lSiteID = @lSiteID) 
BEGIN 
	UPDATE	[dbo].[tblLP_PartnerSiteRadius] 
	SET		[lSearchMile] = ISNULL(@lSearchMile, [lSearchMile]) 
			,[sActive] = ISNULL(@sActive, [sActive]) 
			,[szUpdatedBy] = ISNULL(@szUpdatedBy, [szUpdatedBy]) 
			,[dtUpdate] = ISNULL(@dtUpdate, Getdate()) 
	WHERE [lSiteID] = @lSiteID 
END 
ELSE 
BEGIN 
	INSERT	INTO [dbo].[tblLP_PartnerSiteRadius] ( 
			[lSiteID] , [lSearchMile] , [sActive] , [szUpdatedBy] , [dtUpdate] ) 
	VALUES ( @lSiteID , ISNULL(@lSearchMile, 0) , ISNULL(@sActive, 'Y') , ISNULL(@szUpdatedBy, 'UI') , ISNULL(@dtUpdate, GETDATE()) ) 
END 

SELECT  @lSiteID	AS lSiteID
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSiteRadius] TO [web_user]
GO