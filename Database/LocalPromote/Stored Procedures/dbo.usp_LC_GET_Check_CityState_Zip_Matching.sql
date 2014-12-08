SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] 
	 @State		char(2)
	,@City		varchar(256)
	,@ZipCode	char(5)
AS
--  usp_LP_GET_Check_CityState_Zip_Matching 'ca', 'irvine', '92612'
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

IF @ZipCode in 
				(
				SELECT 
					 ZipCode
				FROM glb_tbl_Location
				WHERE [State] = @State
				AND   [City]  = @City
				)
SELECT @ZipCode AS ZipCode
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Check_CityState_Zip_Matching] TO [web_user]
GO
