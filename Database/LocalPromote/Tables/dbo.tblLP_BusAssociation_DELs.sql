CREATE TABLE [dbo].[tblLP_BusAssociation_DELs]
(
[lBusAssociationID] [int] NOT NULL,
[lAdvertiserID] [int] NOT NULL,
[lAssociationType] [int] NOT NULL,
[szAssociationOther] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__05E62FBB] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__06DA53F4] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
