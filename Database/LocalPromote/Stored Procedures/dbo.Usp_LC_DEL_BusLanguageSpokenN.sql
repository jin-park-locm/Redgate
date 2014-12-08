SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_DEL_BusLanguageSpokenN]     @lLanguageID	int	,@lAdvertiserID int    AS
BEGIN	UPDATE		[dbo].[tblLP_BusLanguageSpoken]	SET			sActive = 'N',				dtUpdate = getdate()	WHERE		[lLanguageID] = @lLanguageID	and			lAdvertiserID = @lAdvertiserIDIF @@ERROR <> 0SELECT @lLanguageID as lLanguageIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_DEL_BusLanguageSpokenN] TO [web_user]
GO
