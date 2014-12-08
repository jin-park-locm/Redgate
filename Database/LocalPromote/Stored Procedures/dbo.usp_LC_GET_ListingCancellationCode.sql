SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingCancellationCode]   @lOrderNo			intASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDSELECT		 n.lNoteID		,n.lOrderNo		,n.sCancelCode
		,c.szCancelCodeName
FROM tblLP_OrderCancellationNote n
JOIN tblAL_CancellationCode      c	ON c.sCancelCode = n.sCancelCode
WHERE    n.lOrderNo = @lOrderNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingCancellationCode] TO [web_user]
GO
