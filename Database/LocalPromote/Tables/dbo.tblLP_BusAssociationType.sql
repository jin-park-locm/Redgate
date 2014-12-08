CREATE TABLE [dbo].[tblLP_BusAssociationType]
(
[lAssociationType] [int] NOT NULL IDENTITY(1, 1),
[szAssociationName] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__230A1C49] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusAssociationType] ADD CONSTRAINT [tblLP_BusAssociationType_PK] PRIMARY KEY CLUSTERED  ([lAssociationType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_BusAssociationType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblLP_BusAssociationType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblLP_BusAssociationType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblLP_BusAssociationType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusAssociationType] TO [web_user]
GO
