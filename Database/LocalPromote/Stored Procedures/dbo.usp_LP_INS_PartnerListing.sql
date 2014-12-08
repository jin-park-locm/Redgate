SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*****************************************************************************
File Name     :   usp_LP_INS_PartnerListing.sql
Description   :   insert the siteid into tblLP_PartnerSite
Comments      :   

Change History

Date       Name     Description
---------- -------- ------------------------------------
03-03-2010 dlabrie   Initial Development
05-25-2010 bwu		 Modified

<example>
exec usp_LP_INS_PartnerListing  31, 2, 'LED', '381006' -- Lead 
exec usp_LP_INS_PartnerListing  31, 6, 'FRE', '381006' -- Free Listing
exec usp_LP_INS_PartnerListing  31, 8, 'FRE', '381006' -- Free Listing with different siteid won't insert
exec usp_LP_INS_PartnerListing  31, 6, 'PAY', '381006' -- Paid Listing
exec usp_LP_INS_PartnerListing  31, 2, 'PAY', '381006' -- Paid Listing with different siteid won't insert
</example>
*****************************************************************************/

CREATE  procedure [dbo].[usp_LP_INS_PartnerListing]

	  @AID	int
	, @SiteID			int
	, @ListingType		char(3)
	, @MID INT

AS

Declare @CurListingType Char(3)

if exists(	select sListingType From tblLP_PartnerListing 
			Where lAdvertiserID=@AID and sActive='Y' and sListingType = 'PAY')
	set @CurListingType = 'PAY'
else
	if exists(	select sListingType From tblLP_PartnerListing 
				Where lAdvertiserID=@AID and sActive='Y' and sListingType = 'FRE') 
		set @CurListingType = 'FRE'
	else
		if exists(	select sListingType From tblLP_PartnerListing 
				Where lAdvertiserID=@AID and sActive='Y' and sListingType = 'LED') 
			set @CurListingType = 'LED'

-- Set @CurListingType = (	Select sListingType 
--						From tblLP_PartnerListing 
--						Where lAdvertiserID=@AID and sActive='Y')

Declare @CurSiteID int
Set @CurSiteID = (		Select	top 1 lSiteID 
						From	tblLP_PartnerListing 
						Where	lAdvertiserID=@AID and sActive='Y' and sListingType = @CurListingType)

Select @CurListingType, @CurSiteID

IF @ListingType='LED' and @CurListingType is null
	BEGIN
		if not exists (select lAdvertiserID from tblLP_PartnerListing 
						where lAdvertiserID = @AID and sListingType = @ListingType)	
			INSERT INTO tblLP_PartnerListing
			(		lSiteID, lAdvertiserID, sListingType, sActive, szUpdatedBy, dtActiveY, dtActiveN	)
			Values (@SiteID, @AID, @ListingType, 'Y', @MID, getDate(), NULL)
		ELSE
			UPDATE	tblLP_PartnerListing
			SET		sActive = 'Y', dtActiveN = null
			FROM	tblLP_PartnerListing
			WHERE	lAdvertiserID = @AID AND sListingType = @ListingType
	END

--- Converted to FREE Listing from Lead
IF @ListingType='FRE' and (@CurListingType is null or @CurListingType='LED')
	BEGIN

		UPDATE	tblLP_PartnerListing
		SET		sActive = 'N', dtActiveN = getdate()
		FROM	tblLP_PartnerListing
		WHERE	lAdvertiserID = @AID AND sListingType = 'LED'

		if not exists (select lAdvertiserID from tblLP_PartnerListing 
					where lAdvertiserID = @AID and sListingType = @ListingType)	
			INSERT INTO tblLP_PartnerListing
			(lSiteID, lAdvertiserID, sListingType, sActive, szUpdatedBy, dtActiveY, dtActiveN	)
			VALUES (@SiteID, @AID, @ListingType, 'Y', @MID, getDate(), NULL)
		ELSE
			UPDATE	tblLP_PartnerListing
			SET		sActive = 'Y', dtActiveN = null
			FROM	tblLP_PartnerListing
			WHERE	lAdvertiserID = @AID AND sListingType = @ListingType
	END

--- Converted to Paid Listing from Free
IF @ListingType='PAY' and @CurListingType<>'PAY'
	BEGIN
		UPDATE tblLP_PartnerListing
		SET sActive = 'N', dtActiveN = getdate()
		FROM tblLP_PartnerListing
		WHERE lAdvertiserID = @AID 		AND sListingType in ( 'FRE', 'LED')
		AND	dtActiveN is null

		if not exists (select lAdvertiserID from tblLP_PartnerListing 
					where lAdvertiserID = @AID and sListingType = @ListingType)	
			INSERT	INTO tblLP_PartnerListing
					(lSiteID, lAdvertiserID, sListingType, sActive, szUpdatedBy, dtActiveY, dtActiveN	)
			VALUES (@SiteID, @AID, @ListingType, 'Y', @MID, getDate(), NULL)
		else
			UPDATE	tblLP_PartnerListing
			SET		sActive = 'Y', dtActiveN = null
			FROM	tblLP_PartnerListing
			WHERE	lAdvertiserID = @AID AND sListingType = @ListingType
	END

GO
GRANT EXECUTE ON  [dbo].[usp_LP_INS_PartnerListing] TO [lcssui]
GO
