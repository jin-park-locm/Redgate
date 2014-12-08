SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_ProductCampaign]     @szCID				varchar(30)	= NULL    ,@lCIDNo			int			= NULL    ,@lSiteID			int			= NULL    ,@lProductID		int			= NULL    ,@szSpecialName		varchar(60) = NULL    ,@szSpecialDesc		varchar(200) = NULL    ,@mSpecialPrice		money		= NULL    ,@sDefault			char(1)		= NULL    ,@sDependency		char(1)		= NULL    ,@sTimeCode			char(2)		= NULL    ,@dtBeginning		datetime	= NULL    ,@dtEnd				datetime	= NULL    ,@sActive			char(1)		= NULL    ,@szUpdatedBy		varchar(20)	= NULL    ,@dtUpdate			datetime	= NULL    ,@lBillingCycle		int			= NULL	,@sAutoDefault		char(1)		= NULLASSET NOCOUNT ONBEGIN
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
			SET @sAutoDefault = 'Y'
		END
		select @sAutoDefault = ISNULL(@sDefault, [sDefault]) from [dbo].[tblLP_ProductCampaign]
			    WHERE [lCIDNo] = @lCIDNo
	END

UPDATE [dbo].[tblLP_ProductCampaign]    SET          [szCID]			= ISNULL(@szCID, [szCID])      --,[lCIDNo]			= ISNULL(@lCIDNo, [lCIDNo])        ,[lSiteID]			= ISNULL(@lSiteID, [lSiteID])        ,[lProductID]		= ISNULL(@lProductID, [lProductID])        ,[szSpecialName]	= ISNULL(@szSpecialName, [szSpecialName])        ,[szSpecialDesc]	= ISNULL(@szSpecialDesc, [szSpecialDesc])        ,[mSpecialPrice]	= ISNULL(@mSpecialPrice, [mSpecialPrice])        ,[sDefault]			= ISNULL(@sDefault, [sDefault])        ,[sDependency]		= ISNULL(@sDependency, [sDependency])        ,[sTimeCode]		= ISNULL(@sTimeCode, [sTimeCode])        ,[dtBeginning]		= ISNULL(@dtBeginning, [dtBeginning])        ,[dtEnd]			= @dtEnd        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]		= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())        ,[lBillingCycle]	= ISNULL(@lBillingCycle, [lBillingCycle])		,[sAutoDefault]	= ISNULL(@sAutoDefault, [sAutoDefault])    WHERE [lCIDNo] = @lCIDNo	-- AND [szCID] = @szCIDIF @@ERROR = 0SELECT @lCIDNo AS lCIDNo --, @szCID AS szCIDEND
GO
