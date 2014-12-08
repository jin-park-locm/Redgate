CREATE TABLE [dbo].[tblLP_AdServiceAreaType]
(
[lAdServiceType] [int] NOT NULL IDENTITY(1, 1),
[szServiceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_AdS__dtUpd__1A2ABD85] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_AdServiceAreaType] ADD CONSTRAINT [tblLP_AdServiceAreaType_PK] PRIMARY KEY NONCLUSTERED  ([lAdServiceType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_AdServiceAreaType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_AdServiceAreaType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_AdServiceAreaType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_AdServiceAreaType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_AdServiceAreaType] TO [web_user]
GO
