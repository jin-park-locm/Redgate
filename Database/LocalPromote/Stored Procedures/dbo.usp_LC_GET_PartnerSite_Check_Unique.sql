SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_PartnerSite_Check_Unique] 
  @szSiteName	Varchar(50)  = NULL
, @szSSURL		Varchar(100) = NULL
, @szSiteEmail	Varchar(100) = NULL
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN	 

	SELECT
	 lSiteID
	,szSiteName
--	,szSSURL 
--	,szPartnerEmail
	From tblLP_PartnerSite		  (nolock) 
	WHERE	szSiteName = @szSiteName 
	OR		szSSURL = @szSSURL
	OR		szSiteEmail = @szSiteEmail
	Order By  szSiteName

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_PartnerSite_Check_Unique] TO [web_user]
GO
