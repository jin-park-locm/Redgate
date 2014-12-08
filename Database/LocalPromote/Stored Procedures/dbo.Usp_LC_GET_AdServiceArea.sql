SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[Usp_LC_GET_AdServiceArea]
Description   :   Update the business listing and its Descriptions

Change History

Date		Name     Description
---------- -------- ------------------------------------
2009		unknown    Initial Development
02-11-2010	dlabrie	   Add join to the lOrderNo to the join

Example:
Usp_LC_GET_AdServiceArea 431844

*********************************************/
SET NOCOUNT ON

-- Mod by Linh
SELECT  DISTINCT
-- End of Mod by Linh 

GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdServiceArea] TO [web_user]
GO