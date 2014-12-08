SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_CourtesyListing_New]
--WHERE RID = @RID AND sAction = @sAction AND sConfirm <> 'T' 
--	AND sAction in ('UPD', 'DEL')  

        ,[sHideAddr]

        ,@szURL 
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [web_user]
GO