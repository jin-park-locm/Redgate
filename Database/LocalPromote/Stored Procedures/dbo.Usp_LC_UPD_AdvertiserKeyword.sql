SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_AdvertiserKeyword]     @lAdvertiserID			int    ,@szKeyword				varchar(150)    ,@sActive				char(1)			= NULL    ,@szUpdatedBy			varchar(50)		= NULL    ,@dtUpdate				datetime		= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_AdvertiserKeyword]    SET          [lAdvertiserid]	= ISNULL(@lAdvertiserID, [lAdvertiserid])        ,[szKeyword]		= ISNULL(@szKeyword, [szKeyword])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]		= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())            WHERE [lAdvertiserid] = @lAdvertiserID AND [szKeyword] = @szKeywordIF @@ERROR = 0SELECT	@lAdvertiserID  AS lAdvertiserID , 		@szKeyword		AS szKeywordEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_AdvertiserKeyword] TO [web_user]
GO
