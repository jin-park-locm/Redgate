SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusSpecialOfferN]     @lOfferURLID  int    AS 
SET NOCOUNT ONBEGIN--    DELETE FROM tblLP_BusSpecialOfferURL--    WHERE lOfferURLID = @lOfferURLID	update dbo.tblLP_BusSpecialOfferURL	set sActive = 'N'		,dtUpdate = getdate()	from dbo.tblLP_BusSpecialOfferURL	where lOfferURLID = @lOfferURLIDIF @@ERROR <> 0SELECT @lOfferURLID as lOfferURLIDEND
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOfferN] TO [web_user]
GO
