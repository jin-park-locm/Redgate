SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[usp_LC_UPD_Agency] 
	@lAdvertiserID int,
	@sSource char(3)
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


BEGIN	 

	UPDATE b
		SET 
			b.sSource = @sSource
	From tblLP_BusListing	b   
 
	WHERE b.lAdvertiserID = @lAdvertiserID  

IF @@ERROR = 0
SELECT @lAdvertiserID AS lAdvertiserID
 
		 

 END


GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Agency] TO [web_user]
GO
