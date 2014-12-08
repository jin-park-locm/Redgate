CREATE TABLE [dbo].[tblLP_AdServiceArea_DELs]
(
[lAdServiceAreaID] [int] NOT NULL,
[lOrderNo] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lLocationID] [int] NOT NULL,
[lAdServiceType] [int] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_AdS__DtDel__002D5665] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_AdS__Machi__01217A9E] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
