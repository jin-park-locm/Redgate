SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Deactivate_Campaign] 
 
@lCIDNo		int
AS 
SET NOCOUNT ON


UPDATE pc
	SET  pc.sActive = 'N'
FROM  tblLP_ProductCampaign pc	 
WHERE  pc.lCIDNo	= @lCIDNo
AND    pc.sDefault  = 'N'

IF @@ERROR = 0
SELECT   @lCIDNo	  AS lCIDNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Deactivate_Campaign] TO [web_user]
GO
