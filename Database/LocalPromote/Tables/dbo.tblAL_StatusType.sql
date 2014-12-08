CREATE TABLE [dbo].[tblAL_StatusType]
(
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szStatusDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Sta__dtUpd__4F67C174] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_StatusType] ADD CONSTRAINT [tblAL_StatusType_PK] PRIMARY KEY NONCLUSTERED  ([sStatus]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [ELIBERATION\aludin]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [ELIBERATION\jtran]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [ELIBERATION\tcoulter]
GRANT INSERT ON  [dbo].[tblAL_StatusType] TO [ELIBERATION\tcoulter]
GRANT UPDATE ON  [dbo].[tblAL_StatusType] TO [ELIBERATION\tcoulter]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_StatusType] TO [web_user]
GO
