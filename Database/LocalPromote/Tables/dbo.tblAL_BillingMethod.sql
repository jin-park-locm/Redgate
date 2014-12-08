CREATE TABLE [dbo].[tblAL_BillingMethod]
(
[lBillingID] [int] NOT NULL IDENTITY(1, 1),
[szBillingDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Bil__dtUpd__5C629536] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_BillingMethod] ADD CONSTRAINT [tblAL_BillingMethod_PK] PRIMARY KEY NONCLUSTERED  ([lBillingID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_BillingMethod] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_BillingMethod] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_BillingMethod] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_BillingMethod] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_BillingMethod] TO [web_user]
GO
