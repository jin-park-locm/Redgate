CREATE TABLE [dbo].[tblCC_acxListingNote]
(
[lCCNoteID] [int] NOT NULL IDENTITY(1, 1),
[lCCListingID] [int] NOT NULL,
[szNote] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedby] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtAdd] [datetime] NULL CONSTRAINT [DF__tblCC_acx__dtAdd__68543626] DEFAULT (getdate())
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCC_acxListingNote] ADD CONSTRAINT [tblCC_acxListingNote_PK] PRIMARY KEY CLUSTERED  ([lCCNoteID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCC_acxListingNote] ADD CONSTRAINT [tblCC_acxListingNote_FK1] FOREIGN KEY ([lCCListingID]) REFERENCES [dbo].[tblCC_acxListing] ([lCCListingID])
GO
GRANT SELECT ON  [dbo].[tblCC_acxListingNote] TO [lcssui]
GRANT SELECT ON  [dbo].[tblCC_acxListingNote] TO [web_user]
GO
