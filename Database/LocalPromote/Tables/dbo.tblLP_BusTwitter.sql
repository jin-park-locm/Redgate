CREATE TABLE [dbo].[tblLP_BusTwitter]
(
[lTableKey] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[lTwitterID] [int] NOT NULL,
[szTwitterName] [varchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__6F4C17CF] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusTwitterDEL] on [dbo].[tblLP_BusTwitter]
for delete
as
insert dbo.tblLP_BusTwitter_DELs(lTableKey,lAdvertiserID,lTwitterID,szTwitterName,sActive,szUpdatedBy,dtUpdate)
select lTableKey,lAdvertiserID,lTwitterID,szTwitterName,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusTwitter] ADD CONSTRAINT [PK_tblLP_BusTwitter] PRIMARY KEY NONCLUSTERED  ([lTableKey]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [idx_AID] ON [dbo].[tblLP_BusTwitter] ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusTwitter] TO [web_user]
GO
