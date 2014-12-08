SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_DEL_BusSpecialOffer]     @lOfferURLID  int    AS 
SET NOCOUNT ONBEGIN    DELETE FROM tblLP_BusSpecialOfferURL    WHERE lOfferURLID = @lOfferURLIDIF @@ERROR <> 0SELECT @lOfferURLID as lOfferURLIDEND
GO
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_DEL_BusSpecialOffer] TO [web_user]
GO
