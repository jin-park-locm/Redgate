CREATE TABLE [dbo].[tblLP_LeadAccountInfo]
(
[lLeadAccountID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[szLoginEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szMidName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[szFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Lea__dtUpd__298DC7FD] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_LeadAccountInfo] ADD CONSTRAINT [tblLP_LeadAccountInfo_PK] PRIMARY KEY NONCLUSTERED  ([lLeadAccountID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
