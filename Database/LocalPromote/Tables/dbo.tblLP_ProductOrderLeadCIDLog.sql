CREATE TABLE [dbo].[tblLP_ProductOrderLeadCIDLog]
(
[lOrdernO] [int] NOT NULL,
[ladvertiserid] [int] NOT NULL,
[OrigKey] [int] NOT NULL,
[szLeadCid] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Pro__dtUpd__589CF14A] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductOrderLeadCIDLog] ADD CONSTRAINT [tblLP_ProductOrderLeadCIDLog_PK] PRIMARY KEY NONCLUSTERED  ([lOrdernO]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_ProductOrderLeadCIDLog] ADD CONSTRAINT [tblLP_ProductOrderLeadCIDLog_FK1] FOREIGN KEY ([lOrdernO]) REFERENCES [dbo].[tblLP_ProductOrder] ([lOrderNo])
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrderLeadCIDLog] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderLeadCIDLog] TO [web_user]
GO
