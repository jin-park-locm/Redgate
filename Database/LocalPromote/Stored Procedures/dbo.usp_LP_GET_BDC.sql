SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

------------------------------------------------------
--- 08/25/2011 GFierro Modified per Dan Savage
---
---
------------------------------------------------------

CREATE procedure [dbo].[usp_LP_GET_BDC]
@BID int
AS 
BEGIN
SELECT b.BDC from glb_tbl_BDC b
WHERE b.BDC = @BID
AND b.iTier >= 3
AND b.sActive = 'Y'
END



GO
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_GET_BDC] TO [web_user]
GO
