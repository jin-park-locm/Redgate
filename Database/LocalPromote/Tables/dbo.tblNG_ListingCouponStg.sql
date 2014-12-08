CREATE TABLE [dbo].[tblNG_ListingCouponStg]
(
[AdvertiserID] [int] NULL,
[CouponID] [int] NULL,
[Flag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalCoupon] [int] NULL,
[dtAdd] [datetime] NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblNG_ListingCouponStg] TO [lcssui]
GRANT SELECT ON  [dbo].[tblNG_ListingCouponStg] TO [web_user]
GO
