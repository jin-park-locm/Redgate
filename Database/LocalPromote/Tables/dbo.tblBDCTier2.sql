CREATE TABLE [dbo].[tblBDCTier2]
(
[lBDCTier2] [int] NOT NULL,
[szBDCDesc] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDisplayName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lParentBDC] [int] NOT NULL,
[iTier] [tinyint] NOT NULL,
[sActiveFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier2] ADD CONSTRAINT [tblBDCTier2_PK] PRIMARY KEY CLUSTERED  ([lBDCTier2]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier2] ADD CONSTRAINT [tblBDCTier2_FK1] FOREIGN KEY ([lParentBDC]) REFERENCES [dbo].[tblBDCTier1] ([lBDCTier1])
GO
GRANT SELECT ON  [dbo].[tblBDCTier2] TO [lcssui]
GRANT SELECT ON  [dbo].[tblBDCTier2] TO [web_user]
GO
