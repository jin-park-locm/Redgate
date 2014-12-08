CREATE TABLE [dbo].[tblLP_BusProductOffered_DELs]
(
[lProductOfferID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[szProductOfferDesc] [varchar] (3000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__3B4E1C33] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__3C42406C] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
