SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_ListingStartEndDates]

@lOrderNo int

AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON

BEGIN
	SELECT    o.dtBeginning, o.dtEnd

	FROM tblLP_ProductOrder o 

	WHERE		o.lOrderNo = @lOrderNo
	AND			o.sActive		= 'Y'
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_ListingStartEndDates] TO [web_user]
GO
