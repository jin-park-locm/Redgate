SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_ProductCampaign]
     @szCID				varchar(30)
--	,@lCIDNo			int
    ,@lSiteID			int
    ,@lProductID		int
    ,@szSpecialName		varchar(60)
    ,@szSpecialDesc		varchar(200)
    ,@mSpecialPrice		money			= NULL
    ,@sDefault			char(1)
    ,@sDependency		char(1)
    ,@sTimeCode			char(2)
    ,@dtBeginning		datetime
    ,@dtEnd				datetime		= NULL
    ,@sActive			char(1)			= 'Y'
    ,@szUpdatedBy		varchar(20)
    ,@dtUpdate			datetime		= NULL
	,@lBillingCycle		int
	,@sAutoDefault		char(1)
 
AS
SET NOCOUNT ON
DECLARE @lCIDNo  int

BEGIN
/*
IF @sDefault = 'Y'
BEGIN
	UPDATE  [dbo].[tblLP_ProductCampaign]
	SET sDefault = 'N', dtUpdate = getdate(), dtEnd = NULL
	WHERE lSiteID = @lSiteID
	AND lProductID = @lProductID
	AND sDefault = 'Y'
*/

IF @sDefault = 'Y'
	BEGIN
	UPDATE  [dbo].[tblLP_ProductCampaign]
		SET sDefault = 'N', dtUpdate = getdate(), dtEnd = NULL
		WHERE lSiteID = @lSiteID
		AND lProductID = @lProductID
		AND sDefault = 'Y'
		SELECT @dtEnd = NULL
	END
-- BELOW IS HARD code for local SSUI....
IF @lProductID = 93 
	BEGIN
		IF @sDefault = 'Y'
		BEGIN
			UPDATE  [dbo].[tblLP_ProductCampaign]
				SET sAutoDefault = 'N', dtUpdate = getdate(), dtEnd = NULL
				WHERE lSiteID = @lSiteID
					AND sAutoDefault = 'Y'
			SELECT @dtEnd = NULL
			SET @sAutoDefault = @sDefault
		END
		ELSE
		BEGIN
			SET @sAutoDefault = @sDefault
		END
	END

INSERT INTO [dbo].[tblLP_ProductCampaign]
( 
		[szCID]
      --,[lCIDNo]
        ,[lSiteID]
        ,[lProductID]
        ,[szSpecialName]
        ,[szSpecialDesc]
        ,[mSpecialPrice]
        ,[sDefault]
        ,[sDependency]
        ,[sTimeCode]
        ,[dtBeginning]
        ,[dtEnd]
        ,[sActive]
        ,[szUpdatedBy]
        ,[dtUpdate]
        ,[lBillingCycle]
		,[sAutoDefault]
)
VALUES
(
         @szCID
      --,@lCIDNo
        ,@lSiteID
        ,@lProductID
        ,@szSpecialName
        ,@szSpecialDesc
        ,@mSpecialPrice
        ,@sDefault
        ,@sDependency
        ,@sTimeCode
        ,@dtBeginning
        ,@dtEnd
        ,@sActive
        ,@szUpdatedBy
        ,ISNULL (@dtUpdate, Getdate())
        ,@lBillingCycle
		,@sAutoDefault
)

IF @@ERROR = 0
BEGIN
	SELECT @lCIDNo = SCOPE_IDENTITY()  
	SELECT @lCIDNo AS lCIDNo
END
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_ProductCampaign] TO [web_user]
GO
