SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_CourtesyListing_New]     @RID			int    ,@sAgencyID		char(2)		= NULL    ,@szTitle		varchar(150)		= NULL    ,@szAddress		varchar(100)	= NULL    ,@szCity		varchar(50)		= NULL    ,@sState		char(2)			= NULL    ,@szZip			varchar(10)		= NULL    ,@szPhone		varchar(12)		= NULL    ,@szURL			varchar(250)	= NULL    ,@sHideAddr		char(1)			= 'N'--    ,@sAction		char(3)			= NULL    ,@sConfirm		char(1)			= 'N'	,@sUPDATE		varchar(50)		= NULL--    ,@dtAdd		datetime			= NULL--    ,@dtTurn		datetime			= NULL--	,@BDC1			int				= NULL--	,@BDC2			int				= NULL--      ASSET NOCOUNT ON  SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDDECLARE @lCCListingID int ----DELETE FROM tblCC_acxListing 
--WHERE RID = @RID AND sAction = @sAction AND sConfirm <> 'T' 
--	AND sAction in ('UPD', 'DEL')       INSERT INTO [dbo].[tblCC_acxListing]    (          [RID]         ,[sAgencyID]        ,[szTitle]         ,[szAddress]         ,[szCity]         ,[sState]         ,[szZip]         ,[szPhone]         ,[szURL] 

        ,[sHideAddr]        ,[sAction]        ,[sConfirm]		,[sUpdate]		,[dtAdd]     )    VALUES    (         @RID         ,@sAgencyID        ,@szTitle         ,@szAddress         ,@szCity         ,@sState         ,@szZip         ,@szPhone 

        ,@szURL         ,@sHideAddr        ,'ADD'        ,@sConfirm        ,@sUpdate		,Getdate()     )IF @@ERROR = 0	BEGIN 		SELECT @lCCListingID = SCOPE_IDENTITY()		SELECT @lCCListingID AS lCCListingID	END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_CourtesyListing_New] TO [web_user]
GO
