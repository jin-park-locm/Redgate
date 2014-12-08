CREATE TABLE [dbo].[tblLP_BusListingProfileURL]
(
[lAdvertiserID] [int] NOT NULL,
[szProfileURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sLPProfile] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_BusListingProfileURL_sLPProfile] DEFAULT ('N'),
[szNonLPProfile] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__dtUpd__1432B864] DEFAULT (getdate())
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_BusListingProfileURLDEL] on [dbo].[tblLP_BusListingProfileURL]
for delete
as
insert dbo.tblLP_BusListingProfileURL_DELs(lAdvertiserID,szProfileURL,sLPProfile,szNonLPProfile,sActive,szUpdatedBy,dtUpdate)
select lAdvertiserID,szProfileURL,sLPProfile,szNonLPProfile,sActive,szUpdatedBy,dtUpdate from deleted
GO
ALTER TABLE [dbo].[tblLP_BusListingProfileURL] ADD CONSTRAINT [tblLP_BusListingProfileURL_PK] PRIMARY KEY CLUSTERED  ([lAdvertiserID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_BusListingProfileURL] ADD CONSTRAINT [tblLP_BusListingProfileURL_FK] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_BusListingProfileURL] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_BusListingProfileURL] TO [web_user]
GO
