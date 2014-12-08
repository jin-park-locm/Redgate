CREATE TABLE [dbo].[tblAL_BillingCycle]
(
[lBillingCycle] [int] NOT NULL IDENTITY(1, 1),
[szBillingCycle] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Bil__dtUpd__0A7E65A1] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_BillingCycle] ADD CONSTRAINT [tblAL_BillingCycle_PK] PRIMARY KEY NONCLUSTERED  ([lBillingCycle]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_BillingCycle] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_BillingCycle] TO [web_user]
GO
