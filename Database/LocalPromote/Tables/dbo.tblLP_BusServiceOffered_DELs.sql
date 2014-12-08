CREATE TABLE [dbo].[tblLP_BusServiceOffered_DELs]
(
[lServiceOfferID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[szServiceOfferDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__4106F589] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__41FB19C2] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
