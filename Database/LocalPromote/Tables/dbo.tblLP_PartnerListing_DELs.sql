CREATE TABLE [dbo].[tblLP_PartnerListing_DELs]
(
[lSiteID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[sListingType] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtActiveY] [datetime] NOT NULL,
[dtActiveN] [datetime] NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Par__DtDel__5231818B] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Par__Machi__5325A5C4] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
