SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Partner_Check_Unique] 
  @szPartnerName	Varchar(50)  = NULL
, @szSSURL			Varchar(100) = NULL
, @szPartnerEmail	Varchar(100) = NULL
AS
SET NOCOUNT ON

SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED

BEGIN	 

	SELECT	-- distinct
	 lPartnerID  
	,szPartnerName
--	,szSSURL 
--	,szPartnerEmail
	From tblLP_Partner		  (nolock) 
	WHERE	szPartnerName = @szPartnerName 
	OR		szSSURL = @szSSURL
	OR		szPartnerEmail = @szPartnerEmail
	Order By  szPartnerName

 END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Partner_Check_Unique] TO [web_user]
GO
