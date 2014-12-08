SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_ListingCancellationCode]
     @lOrderNo		int
    ,@sCancelCode	char(3)
--    ,@sActive		char(1)		= NULL
--    ,@szUpdatedBy	varchar(20) = NULL
--    ,@dtUpdate		datetime	= NULL
    
AS
SET NOCOUNT ON

BEGIN

    UPDATE [dbo].[tblLP_OrderCancellationNote]
    SET 
         [sCancelCode]	= ISNULL(@sCancelCode, [sCancelCode])
--        ,[sActive]		= ISNULL(@sActive, [sActive])
--        ,[szUpdatedBy]	= ISNULL(@szUpdatedBy, [szUpdatedBy])
        ,[dtUpdate]		=  Getdate()
        
    WHERE lOrderNo = @lOrderNo
END
IF @@ERROR = 0
SELECT	 @lOrderNo		AS lOrderNo
		,@sCancelCode	AS sCancelCode
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_ListingCancellationCode] TO [web_user]
GO
