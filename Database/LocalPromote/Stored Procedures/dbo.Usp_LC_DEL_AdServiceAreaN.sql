SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_AdServiceAreaN]     @lAdServiceAreaID  int    ASBEGIN	update [dbo].[tblLP_AdServiceArea]	set sActive = 'N', 		dtUpdate = getdate()	where lAdServiceAreaID = @lAdServiceAreaIDIF @@ERROR <> 0SELECT @lAdServiceAreaID as lAdServiceAreaIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_AdServiceAreaN] TO [web_user]
GO
