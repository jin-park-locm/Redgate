CREATE TABLE [dbo].[tblML_BillingEntityLog]
(
[lBELogId] [int] NOT NULL,
[lBillingEntityID] [int] NOT NULL,
[lCIDno] [int] NOT NULL,
[CID] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblML_BillingEntityLog] TO [ClientService]
GRANT INSERT ON  [dbo].[tblML_BillingEntityLog] TO [ClientService]
GRANT DELETE ON  [dbo].[tblML_BillingEntityLog] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblML_BillingEntityLog] TO [ClientService]
GRANT SELECT ON  [dbo].[tblML_BillingEntityLog] TO [ELIBERATION\imarquais]
GRANT INSERT ON  [dbo].[tblML_BillingEntityLog] TO [ELIBERATION\imarquais]
GRANT DELETE ON  [dbo].[tblML_BillingEntityLog] TO [ELIBERATION\imarquais]
GRANT UPDATE ON  [dbo].[tblML_BillingEntityLog] TO [ELIBERATION\imarquais]
GRANT SELECT ON  [dbo].[tblML_BillingEntityLog] TO [lcssui]
GRANT SELECT ON  [dbo].[tblML_BillingEntityLog] TO [MktgAccess]
GRANT INSERT ON  [dbo].[tblML_BillingEntityLog] TO [MktgAccess]
GRANT DELETE ON  [dbo].[tblML_BillingEntityLog] TO [MktgAccess]
GRANT UPDATE ON  [dbo].[tblML_BillingEntityLog] TO [MktgAccess]
GRANT SELECT ON  [dbo].[tblML_BillingEntityLog] TO [web_user]
GO
