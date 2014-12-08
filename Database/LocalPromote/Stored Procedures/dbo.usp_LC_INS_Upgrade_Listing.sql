SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_Upgrade_Listing]  
/**********************************************************************************
Description   :   Upgrade a listing

Date       Name     Description
---------- -------- ---------------------------------------------------------------
03-23-2010 bwu		Added heading, and modified code to update partnerlisting table

EXAMPLES:	exec usp_LC_INS_Upgrade_Listing @lCIDNo='2412', @lBillingID='2', @mPaidFee='39.99'
			, @lBillingCycle='2', @lAdvertiserID='84367', @lSiteID='300', @szUpdatedBy='167471'
**********************************************************************************/
@lCIDNo				int,
@lBillingID			int,
@mPaidFee			money		= NULL,
@lBillingCycle		int,
@lAdvertiserID		int,
@dtBeginning		datetime	= NULL,
@dtEnd				datetime	= NULL,
@sActive			char(1)		= 'Y',
@lSalesPersonID		INT			= NULL,
@szUpdatedBy		varchar(20) = 'UI',
@lSiteID			int,
@dtUpdate			datetime	= NULL
 
AS 
SET NOCOUNT ON  

DECLARE @lOrderNo int, @ERR int

select @ERR = 0 

BEGIN
	UPDATE o
		SET		o.dtEnd	= Getdate(),
				o.sActive = 'N'
 	FROM tblLP_ProductOrder    o
	JOIN tblLP_ProductCampaign c ON c.lCIDNo		= o.lCIDNo
	JOIN tblLP_PartnerSite     s ON s.lSiteID		= c.lSiteID
	WHERE o.lAdvertiserID = @lAdvertiserID	
	AND   s.lSiteID = @lSiteID
	AND	  o.sActive = 'Y'
  --AND   s.sSiteType = 'PS'
 
	SELECT @ERR = @@ERROR 

	UPDATE po
	SET sActive = 'I'
 	FROM tblLP_ProductOrder    po
	JOIN tblLP_ProductCampaign c ON c.lCIDNo		= po.lCIDNo
	JOIN tblLP_PartnerSite     s ON s.lSiteID		= c.lSiteID
	WHERE po.lAdvertiserID = @lAdvertiserID
	AND   s.lSiteID = @lSiteID
	AND   DATEDIFF(day, po.dtBeginning, po.dtEnd) < 1

	SELECT @ERR = @ERR + @@ERROR

	INSERT INTO tblLP_ProductOrder
		(
		lCIDNo,
		lBillingID,
		mPaidFee,
		lBillingCycle,
		lAdvertiserID,
		dtBeginning,
		dtEnd,
		sActive,
		szUpdatedBy,
		dtUpdate,
		lSalesPersonID
		)

	VALUES	(
		@lCIDNo,
		@lBillingID,
		@mPaidFee,
		@lBillingCycle,
		@lAdvertiserID,
		getdate(),
		@dtEnd,
		@sActive,
		@szUpdatedBy,
		getdate(),
		isNull(@lSalesPersonID, 1)
		)

	SELECT @ERR = @ERR + @@ERROR
	SELECT @lOrderNo = SCOPE_IDENTITY()

	IF NOT EXISTS (select	1 from dbo.tblLP_PartnerListing 
					WHERE	lAdvertiserID = @lAdvertiserID
					AND		sListingType = 'PAY'
					AND		sActive = 'Y')
	BEGIN
		UPDATE	a
		SET		a.sActive = 'N', dtActiveN = getdate(), szUpdatedBy = 'UI'			
		--		SELECT *
		FROM	dbo.tblLP_PartnerListing a
		WHERE	a.lAdvertiserID = @lAdvertiserID
		AND		a.sActive = 'Y'
		AND		(a.sListingType = 'FRE' OR a.sListingType = 'LED')

		IF EXISTS(	SELECT	1 FROM dbo.tblLP_PartnerListing
					WHERE	lAdvertiserID = @lAdvertiserID
					AND		sListingType = 'PAY')
			BEGIN
				UPDATE	a
				SET		a.sActive = 'Y', dtActiveN = null, szUpdatedBy = 'UI'			
				--		SELECT *
				FROM	dbo.tblLP_PartnerListing a
				WHERE	a.lAdvertiserID = @lAdvertiserID
				AND		a.sListingType = 'PAY'
			END
		ELSE
			BEGIN
				INSERT	INTO dbo.tblLP_PartnerListing
						(lSiteID, lAdvertiserID, sListingType, sActive, szUpdatedBy, dtActiveY)
				values	(@lSiteID, @lAdvertiserID, 'PAY', 'Y', 'UI', getdate())
			END
	END					-- end of modification on 3/23/2010
END

IF @ERR = 0
BEGIN
	SELECT @lOrderNo AS lOrderNo
END


GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_Upgrade_Listing] TO [web_user]
GO
