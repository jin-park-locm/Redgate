CREATE TABLE [dbo].[tblLP_ListingCoupon_old]
(
[lCouponID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lCouponNo] [int] NOT NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_lAdvertiserID] ON [dbo].[tblLP_ListingCoupon_old] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [Idx_lCouponID] ON [dbo].[tblLP_ListingCoupon_old] ([lCouponID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx_lCouponNo] ON [dbo].[tblLP_ListingCoupon_old] ([lCouponNo]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ListingCoupon_old] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ListingCoupon_old] TO [web_user]
GO
