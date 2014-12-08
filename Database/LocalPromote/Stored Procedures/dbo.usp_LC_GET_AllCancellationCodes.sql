SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_AllCancellationCodes]ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSELECT sCancelCode, szCancelCodeName
FROM tblAL_CancellationCode
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_AllCancellationCodes] TO [web_user]
GO
