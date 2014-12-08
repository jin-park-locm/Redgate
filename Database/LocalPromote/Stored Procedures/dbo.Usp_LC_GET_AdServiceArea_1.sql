SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


Create PROCEDURE [dbo].[Usp_LC_GET_AdServiceArea_1]@lAdvertiserID intASSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON
/*SELECT		[lAdServiceAreaID]    , a.[lOrderNo]    , a.[lAdvertiserID]    , a.[lLocationID]    , a.[lAdServiceType]    , a.[sActive]	,	[szServiceType]	, l.[szLocationName] -- cityName	, l.[State]	, c.[szLocationName] as countyNameFROM [dbo].[tblLP_AdServiceArea] aJOIN [dbo].[tblLP_AdServiceAreaType] t	ON t.[lAdServiceType] = a.[lAdServiceType]JOIN [dbo].[tblAL_Location] l ON l.[lLocationID] = a.[lLocationID]JOIN [dbo].[tblAL_StateCounty] c ON l.[lStateCountyID] = c.[lStateCountyID]WHERE a.lAdvertiserID = @lAdvertiserID--AND   sActive = 'Y'
*/

-- Mod by Linh
SELECT  DISTINCT		MIN([lAdServiceAreaID]) as lAdServiceAreaID    , a.[lOrderNo]    , a.[lAdvertiserID]    , MIN(a.[lLocationID]) as  lLocationID    , a.[lAdServiceType]    , a.[sActive]	,	[szServiceType]	, MIN(l.[szLocationName]) as szLocationName -- cityName 	, l.[State]	, c.[szLocationName] as countyNameFROM [dbo].[tblLP_AdServiceArea] aJOIN [dbo].[tblLP_AdServiceAreaType] t	ON t.[lAdServiceType] = a.[lAdServiceType]JOIN [dbo].[tblAL_Location] l ON l.[lLocationID] = a.[lLocationID]JOIN [dbo].[tblAL_StateCounty] c ON l.[lStateCountyID] = c.[lStateCountyID]Join tblLP_ProductOrder o on a.lOrderno=o.lOrdernoWHERE a.lAdvertiserID = @lAdvertiserID AND a.[lAdServiceType] = 1AND a.sActive = 'Y' --Added on 01/06/2010GROUP BY a.[lOrderNo], a.[lAdvertiserID], a.[sActive], a.[lAdServiceType], [szServiceType], c.[szLocationName], l.[State]UNION ALLSELECT  DISTINCT		[lAdServiceAreaID]    , a.[lOrderNo]    , a.[lAdvertiserID]    , a.[lLocationID]    , a.[lAdServiceType]    , a.[sActive]	,	[szServiceType]	, l.[szLocationName] as szLocationName -- cityName 	, l.[State]	, c.[szLocationName] as countyNameFROM [dbo].[tblLP_AdServiceArea] aJOIN [dbo].[tblLP_AdServiceAreaType] t	ON t.[lAdServiceType] = a.[lAdServiceType]JOIN [dbo].[tblAL_Location] l ON l.[lLocationID] = a.[lLocationID]JOIN [dbo].[tblAL_StateCounty] c ON l.[lStateCountyID] = c.[lStateCountyID]Join tblLP_ProductOrder o on a.lOrderno=o.lOrdernoWHERE a.lAdvertiserID = @lAdvertiserID AND a.[lAdServiceType] = 4AND a.sActive = 'Y' --Added on 01/01/2010ORDER BY a.[lAdServiceType]
-- End of Mod by Linh 

GO
