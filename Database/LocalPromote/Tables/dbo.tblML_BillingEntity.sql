CREATE TABLE [dbo].[tblML_BillingEntity]
(
[lBillingEntityID] [int] NOT NULL,
[BillingEntityName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblML_BillingEntity] ADD CONSTRAINT [tblML_BillingEntity_PK] PRIMARY KEY CLUSTERED  ([lBillingEntityID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblML_BillingEntity] TO [ELIBERATION\imarquais]
GRANT INSERT ON  [dbo].[tblML_BillingEntity] TO [ELIBERATION\imarquais]
GRANT DELETE ON  [dbo].[tblML_BillingEntity] TO [ELIBERATION\imarquais]
GRANT UPDATE ON  [dbo].[tblML_BillingEntity] TO [ELIBERATION\imarquais]
GRANT SELECT ON  [dbo].[tblML_BillingEntity] TO [lcssui]
GRANT SELECT ON  [dbo].[tblML_BillingEntity] TO [MktgAccess]
GRANT INSERT ON  [dbo].[tblML_BillingEntity] TO [MktgAccess]
GRANT DELETE ON  [dbo].[tblML_BillingEntity] TO [MktgAccess]
GRANT UPDATE ON  [dbo].[tblML_BillingEntity] TO [MktgAccess]
GRANT SELECT ON  [dbo].[tblML_BillingEntity] TO [web_user]
GO
