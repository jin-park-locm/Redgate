CREATE TABLE [dbo].[tblLP_KeywordExcluded]
(
[lExcludedID] [int] NOT NULL IDENTITY(1, 1),
[lAdvertiserID] [int] NOT NULL,
[BDC] [int] NOT NULL,
[szKeyword] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdateBy] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tblLP_KeywordExcluded_sActive] DEFAULT ('Y')
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create trigger [dbo].[tblLP_KeywordExcludedDEL] on [dbo].[tblLP_KeywordExcluded]
for delete
as
insert dbo.tblLP_KeywordExcluded_DELs(lExcludedID,lAdvertiserID,BDC,szKeyword,szUpdateBy,dtUpdate,sActive)
select lExcludedID,lAdvertiserID,BDC,szKeyword,szUpdateBy,dtUpdate,sActive from deleted
GO
ALTER TABLE [dbo].[tblLP_KeywordExcluded] ADD CONSTRAINT [tblLP_KeywordExcluded_PK] PRIMARY KEY CLUSTERED  ([lExcludedID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_KeywordExcluded] ADD CONSTRAINT [tblLP_KeywordExcluded_BusListing] FOREIGN KEY ([lAdvertiserID]) REFERENCES [dbo].[tblLP_BusListing] ([lAdvertiserID])
GO
GRANT SELECT ON  [dbo].[tblLP_KeywordExcluded] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_KeywordExcluded] TO [web_user]
GO
