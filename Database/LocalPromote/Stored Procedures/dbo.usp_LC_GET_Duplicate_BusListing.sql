SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Duplicate_BusListing]  
(
	@szTitle  VARCHAR(150),  
	@szStreetName  VARCHAR(150),  
	@szPhone  VARCHAR(10)   
) 
AS  
   
SET NOCOUNT ON  

SELECT  DISTINCT
	 RIDAX as ListingID    
	,szTitle  
	,szStreetName  
	,szUnit  
	,szCity
	,sState
	,szPhone  
	,szEmail  
FROM tblLP_BusListing 
WHERE szTitle = @szTitle 
AND 
(
	(@szStreetName = szStreetName) 
	OR 
	(@szPhone = szPhone)
)

GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Duplicate_BusListing] TO [LocalConnect]
GO
