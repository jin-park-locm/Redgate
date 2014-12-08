CREATE TABLE [dbo].[tblBDCTier3]
(
[lBDCTier3] [int] NOT NULL,
[szBDCDesc] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szDisplayName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lParentBDC] [int] NOT NULL,
[iTier] [tinyint] NOT NULL,
[sActiveFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier3] ADD CONSTRAINT [tblBDCTier3_PK] PRIMARY KEY NONCLUSTERED  ([lBDCTier3]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBDCTier3] ADD CONSTRAINT [tblBDCTier3_FK1] FOREIGN KEY ([lParentBDC]) REFERENCES [dbo].[tblBDCTier2] ([lBDCTier2])
GO
GRANT SELECT ON  [dbo].[tblBDCTier3] TO [lcssui]
GRANT SELECT ON  [dbo].[tblBDCTier3] TO [web_user]
GO
