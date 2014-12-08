CREATE TABLE [dbo].[tblAL_TimeTerm]
(
[sTimeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szTimeTermName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Tim__dtUpd__1D5142F3] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_TimeTerm] ADD CONSTRAINT [tblAL_TimeTerm_PK] PRIMARY KEY NONCLUSTERED  ([sTimeCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_TimeTerm] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_TimeTerm] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_TimeTerm] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_TimeTerm] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_TimeTerm] TO [web_user]
GO
