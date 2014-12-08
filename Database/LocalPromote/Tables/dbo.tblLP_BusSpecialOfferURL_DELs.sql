CREATE TABLE [dbo].[tblLP_BusSpecialOfferURL_DELs]
(
[lOfferURLID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[szDisplayURL] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szURL] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__43E36234] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__44D7866D] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
