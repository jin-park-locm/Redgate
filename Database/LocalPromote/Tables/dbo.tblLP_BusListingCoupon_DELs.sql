CREATE TABLE [dbo].[tblLP_BusListingCoupon_DELs]
(
[lCouponID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lCouponNo] [int] NOT NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__2A239031] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__2B17B46A] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
