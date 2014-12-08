SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_ListingStartEndDates]

@lOrderNo		int,
@dtBeginning	datetime	= NULL,
@dtEnd			datetime	= NULL

AS 
SET NOCOUNT ON


BEGIN

	UPDATE o
			SET
				dtBeginning		= ISNULL(@dtBeginning, Getdate()), 
				dtEnd			= @dtEnd

	FROM tblLP_ProductOrder o
	WHERE		o.lOrderNo = @lOrderNo
	--AND o.sActive = 'Y'
END

IF @@ERROR = 0
SELECT @lOrderNo AS lOrderNo
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_ListingStartEndDates] TO [web_user]
GO
