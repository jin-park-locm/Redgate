CREATE TABLE [dbo].[tblAL_Source]
(
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szSourceDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sHeading] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sDisplay] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sLDACFlag] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__tblAL_Sou__sLDAC__67752086] DEFAULT ('N'),
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Lis__dtUpd__0F03239C] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAL_Source] ADD CONSTRAINT [tblLP_ListingSource_PK] PRIMARY KEY NONCLUSTERED  ([sSource]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblAL_Source] TO [ClientService]
GRANT INSERT ON  [dbo].[tblAL_Source] TO [ClientService]
GRANT DELETE ON  [dbo].[tblAL_Source] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblAL_Source] TO [ClientService]
GRANT SELECT ON  [dbo].[tblAL_Source] TO [ELIBERATION\imarquais]
GRANT INSERT ON  [dbo].[tblAL_Source] TO [ELIBERATION\imarquais]
GRANT DELETE ON  [dbo].[tblAL_Source] TO [ELIBERATION\imarquais]
GRANT UPDATE ON  [dbo].[tblAL_Source] TO [ELIBERATION\imarquais]
GRANT SELECT ON  [dbo].[tblAL_Source] TO [lcssui]
GRANT SELECT ON  [dbo].[tblAL_Source] TO [MktgAccess]
GRANT INSERT ON  [dbo].[tblAL_Source] TO [MktgAccess]
GRANT DELETE ON  [dbo].[tblAL_Source] TO [MktgAccess]
GRANT UPDATE ON  [dbo].[tblAL_Source] TO [MktgAccess]
GRANT SELECT ON  [dbo].[tblAL_Source] TO [web_user]
GO
