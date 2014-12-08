SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_AdvertiserKeyword]     @lAdvertiserid		int    ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT         [lKeywordiD]--		,[lAdvertiserid]        ,[szKeyword]	FROM [dbo].[tblLP_AdvertiserKeyword]	WHERE lAdvertiserid = @lAdvertiseridEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_AdvertiserKeyword] TO [web_user]
GO
