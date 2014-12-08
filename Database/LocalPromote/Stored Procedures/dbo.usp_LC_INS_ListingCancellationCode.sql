SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_ListingCancellationCode]
Description   :   Insert Cancellation notes

Change History

Date		Name     Description
---------- -------- ------------------------------------
2009		unknown    Initial Development
02-11-2010	dlabrie	   Change the value returned from lnoteid to sCancelCode per LPADminB-955

Example:
usp_LC_INS_ListingCancellationCode
@lOrderNo=11661,
@sCancelCode='CST',

select * from tblLP_OrderCancellationNote where lOrderNo=11661
*********************************************/
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [web_user]
GO