SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[usp_DT_CouponAnalog_Merge]
AS
BEGIN
	SET NOCOUNT ON

	delete	b
	from	dbo.tblNG_ListingImport a
	join	dbo.tblLP_BusListingCoupon b on (a.AdvertiserID=b.lAdvertiserID and a.CouponID=b.lCouponNo)
	where	a.Flag='D'

	insert	tblLP_BusListingCoupon(lAdvertiserID,lCouponNo,sAgencyID,szUpdatedBy,dtAdd)
	select	a.AdvertiserID,a.CouponID,'NG','DT_CouponAnalog_Merge',GETDATE()
	from	dbo.tblNG_ListingImport a
	left join	dbo.tblLP_BusListingCoupon b on (a.AdvertiserID=b.lAdvertiserID and a.CouponID=b.lCouponNo)
	where	b.lAdvertiserID is null
	and		a.Flag in ('A','U')

END
GO
