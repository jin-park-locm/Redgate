SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_ListingCancellationCode]/********************************************
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
*********************************************/     @lOrderNo			int    ,@sCancelCode		char(3)    ,@sActive			char(1)	 = 'Y'    ,@szUpdatedBy  varchar(20)	 = 'UI'    ,@dtUpdate  datetime		 = NULL    ASSET NOCOUNT ON --DECLARE @lNoteID  int BEGIN    INSERT INTO [dbo].[tblLP_OrderCancellationNote]    (          [lOrderNo]        ,[sCancelCode]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]            )    VALUES    (         @lOrderNo        ,@sCancelCode        ,@sActive        ,@szUpdatedBy        ,ISNULL(@dtUpdate, Getdate())            )ENDIF @@ERROR = 0select @sCancelCode as sCancelCode--SELECT @lNoteID = SCOPE_IDENTITY()--SELECT @lNoteID  AS lNoteID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_ListingCancellationCode] TO [web_user]
GO
