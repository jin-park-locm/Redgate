CREATE TABLE [dbo].[tblAL_AddressType]
(
[sAdrTypeCode] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szAdrTypeDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Add__dtUpd__3A6CA48E] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_AddressType] ADD CONSTRAINT [tblAL_AddressType_PK] PRIMARY KEY NONCLUSTERED  ([sAdrTypeCode]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_AddressType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_AddressType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_AddressType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_AddressType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_AddressType] TO [web_user]
GO
