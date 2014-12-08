CREATE TABLE [dbo].[tblLP_CancelAdLog]
(
[lCancelLogID] [int] NOT NULL,
[sPartnerType] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lMemberID] [int] NOT NULL IDENTITY(1, 1),
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_CancelAdLog_sAction] DEFAULT ('D'),
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Can__dtUpd__78FED3E4] DEFAULT (getdate()),
[szUpdatedBy] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CancelAdLog] ADD CONSTRAINT [tblLP_CancelAdLog_PK] PRIMARY KEY NONCLUSTERED  ([lCancelLogID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_CancelAdLog] ADD CONSTRAINT [tblLP_CancelAdLog_FK2] FOREIGN KEY ([lMemberID]) REFERENCES [dbo].[tblLP_MemberInfo] ([lMemberID])
GO
ALTER TABLE [dbo].[tblLP_CancelAdLog] ADD CONSTRAINT [tblLP_CancelAdLog_FK1] FOREIGN KEY ([sPartnerType]) REFERENCES [dbo].[tblLP_PartnerSiteType] ([sSiteType])
GO
GRANT SELECT ON  [dbo].[tblLP_CancelAdLog] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_CancelAdLog] TO [web_user]
GO
