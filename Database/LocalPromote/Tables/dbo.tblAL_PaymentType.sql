CREATE TABLE [dbo].[tblAL_PaymentType]
(
[lPymtTypeID] [int] NOT NULL IDENTITY(1, 1),
[szPymtDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Pay__dtUpd__1980B20F] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_PaymentType] ADD CONSTRAINT [tblAL_PaymentType_PK] PRIMARY KEY CLUSTERED  ([lPymtTypeID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_PaymentType] TO [ClientService]
GRANT SELECT ON  [dbo].[tblAL_PaymentType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_PaymentType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_PaymentType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_PaymentType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_PaymentType] TO [web_user]
GO
