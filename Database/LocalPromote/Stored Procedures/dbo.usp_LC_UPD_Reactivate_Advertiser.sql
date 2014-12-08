SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_Reactivate_Advertiser]
@lMemberID int
AS
SET NOCOUNT ON

DECLARE @ERR int
BEGIN TRAN


	UPDATE  m
		SET m.sActive = 'Y',
			m.dtUpdate = Getdate()
	-- SELECT * 
	FROM tblLP_MemberInfo m
	WHERE m.lMemberID = @lMemberID
	AND   m.sActive = 'N'

	SELECT @ERR = @@ERROR

	UPDATE  p
		SET  p.sListingType = 'PAY'

	FROM	tblLP_PartnerListing	p
	JOIN	tblLP_ProductCampaign	c	ON p.lSiteID		= c.lSiteID  
	JOIN	tblLP_ProductOrder		o	ON c.lCIDNo			= o.lCIDNo 
									   AND p.lAdvertiserID	= o.lAdvertiserID 
	JOIN	tblLP_BusListing		b   ON p.lAdvertiserID  = b.lAdvertiserID 
									   AND p.lAdvertiserID	= b.lAdvertiserID  
	JOIN	tblLP_MemberInfo		m	ON b.lMemberID		= m.lMemberID
	WHERE	(p.sListingType = 'FRE' OR p.sListingType = 'LED' )
	AND		m.lMemberID = @lMemberID
	SELECT @ERR = @ERR + @@ERROR

/*	
	INSERT INTO tblLP_ProductOrder
	(
			lCIDNo,
			lBillingID,
			lSalesPersonID,
			mPaidFee,
			lBillingCycle,
			lAdvertiserID,
			dtBeginning,
			sActive,
			szUpdatedBy,
			dtUpdate
	)

	SELECT top 1  
			o.lCIDNo,
			o.lBillingID,
			o.lSalesPersonID,
			o.mPaidFee,
			o.lBillingCycle,
			o.lAdvertiserID,  
			  Getdate(),
			  'Y',
			  'UI',
			  Getdate()
	FROM	tblLP_PartnerListing	p
	JOIN	tblLP_ProductCampaign	c	ON p.lSiteID		= c.lSiteID  
	JOIN	tblLP_ProductOrder		o	ON c.lCIDNo			= o.lCIDNo 
									   AND p.lAdvertiserID	= o.lAdvertiserID 
	JOIN	tblLP_BusListing		b   ON p.lAdvertiserID  = b.lAdvertiserID 
									   AND p.lAdvertiserID	= b.lAdvertiserID  
	JOIN	tblLP_MemberInfo		m	ON b.lMemberID		= m.lMemberID
	WHERE	p.sListingType = 'PAY'
	AND		m.lMemberID = @lMemberID

*/

IF @ERR =0
BEGIN
	COMMIT TRAN
	SELECT @lMemberID AS lMemberID
END
ELSE
	ROLLBACK TRAN

GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_Reactivate_Advertiser] TO [web_user]
GO
