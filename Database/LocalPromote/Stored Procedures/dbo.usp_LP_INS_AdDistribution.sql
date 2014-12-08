SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[usp_LP_INS_AdDistribution]
/**********************************************************************************
Description   :  Insert to PartnerListing 

Change History

Date       Name     Description
---------- -------- ------------------------------------
08-30-2008 dlabrie    Initial Development

EXAMPLES: 	
	exec usp_LP_INS_AdDistribution 2, 123456789,2, '35' 
    select * from tbllp_AdDistribution where lAdvertiserID = 123456789 
**********************************************************************************/

	@SiteID int,	
	@AdvertiserID	int,
	@OrderNo int,
	@UpdatedBy varchar(20)
as
SET NOCOUNT ON

declare @AdDistType int
select @AdDistType = lDistTypeid from tblLP_PartnerSite where lSiteID = @SiteID

if (isnull(@AdDistType, 0) = 2)
	BEGIN
		Insert into tblLP_AdDistribution
		(lAdvertiserid, lSiteID, lOrderNo, lAdServiceType, sActive, szUpdatedBy,dtUpdate)		
		select	@AdvertiserID, lSiteID, @OrderNo, 2, 'Y', @UpdatedBy, getdate()
		from	tblLP_Partnersite 
		where	lPartnerID in (
				select lPartnerID from tblLP_Partnersite 
				where lSiteID = @SiteID and sActive = 'Y')	
		and		lSiteID not in (select lSiteID from tblLP_AdDistribution 
						where lorderNO = @OrderNo and sActive = 'Y')
	END
else
	BEGIN
		if not exists(select lSiteID from tblLP_AdDistribution where lSiteID = @Siteid and lOrderNo = @OrderNo)
			Insert into tblLP_AdDistribution
			(lSiteID, lAdvertiserID, lOrderNo, lAdServiceType, sActive, szUpdatedBy,dtUpdate)
			Values (@Siteid, @Advertiserid, @OrderNo, 2,'Y', @UpdatedBy, Getdate())
	END
GO
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LP_INS_AdDistribution] TO [web_user]
GO
