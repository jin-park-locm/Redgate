CREATE TABLE [dbo].[tblAL_PhoneType]
(
[sPhoneType] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szPhoneTypeDesc] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblAL_Pho__dtUpd__4B973090] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_PhoneType] ADD CONSTRAINT [tblAL_PhoneType_PK] PRIMARY KEY NONCLUSTERED  ([sPhoneType]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_PhoneType] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblAL_PhoneType] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblAL_PhoneType] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblAL_PhoneType] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_PhoneType] TO [web_user]
GO
