SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_Excluded_Category_Keyword]     @lAdvertiserID		int			 = NULL    ,@BDC				int			 = NULL    ,@szKeyword			varchar(150) = NULL    ,@szUpdateBy		varchar(50)	 = 'UI'    ,@dtUpdate			datetime	 = NULL    ASSET NOCOUNT ONDECLARE @lExcludedID intBEGIN    INSERT INTO [dbo].[tblLP_KeywordExcluded]    (          [lAdvertiserID]        ,[BDC]        ,[szKeyword]        ,[szUpdateBy]        ,[dtUpdate]            )    VALUES    (         @lAdvertiserID        ,@BDC        ,@szKeyword        ,@szUpdateBy        ,ISNULL(@dtUpdate, Getdate())            )ENDIF @@ERROR = 0SELECT @lExcludedID = SCOPE_IDENTITY()SELECT @lExcludedID AS lExcludedID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Excluded_Category_Keyword] TO [web_user]
GO
