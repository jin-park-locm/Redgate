CREATE TABLE [dbo].[tblLP_KeywordExcluded_DELs]
(
[lExcludedID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[BDC] [int] NOT NULL,
[szKeyword] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdateBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Key__DtDel__4F5514E0] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Key__Machi__50493919] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
