SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_ProductCampaign]
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

UPDATE [dbo].[tblLP_ProductCampaign]
GO