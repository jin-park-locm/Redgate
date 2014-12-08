CREATE TABLE [dbo].[acx_map_listingBDC]
(
[RID] [int] NULL,
[ListingID] [uniqueidentifier] NULL,
[BDC] [int] NOT NULL,
[BDCOrig] [int] NULL,
[Latitude] [decimal] (9, 6) NULL,
[Longitude] [decimal] (9, 6) NULL,
[col] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NULL,
[PartnerRID] [varchar] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgencyID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Bdc] ON [dbo].[acx_map_listingBDC] ([BDC]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_RID] ON [dbo].[acx_map_listingBDC] ([RID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[acx_map_listingBDC] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[acx_map_listingBDC] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[acx_map_listingBDC] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[acx_map_listingBDC] TO [lcssui]
GRANT SELECT ON  [dbo].[acx_map_listingBDC] TO [web_user]
GO
