CREATE TABLE [dbo].[tblLP_BusListingCoupon_old]
(
[lCouponID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lCouponNo] [int] NOT NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtAdd] [datetime] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Idx_lAdvertiserID] ON [dbo].[tblLP_BusListingCoupon_old] ([lAdvertiserID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_lCouponNo] ON [dbo].[tblLP_BusListingCoupon_old] ([lCouponNo]) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingCoupon_old] TO [web_user]
GO
