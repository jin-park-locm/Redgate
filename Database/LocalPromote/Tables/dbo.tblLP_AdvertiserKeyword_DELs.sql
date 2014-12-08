CREATE TABLE [dbo].[tblLP_AdvertiserKeyword_DELs]
(
[lKeywordiD] [int] NOT NULL,
[lAdvertiserid] [int] NOT NULL,
[szKeyword] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Adv__DtDel__0309C310] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Adv__Machi__03FDE749] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
