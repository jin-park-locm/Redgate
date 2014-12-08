CREATE TABLE [dbo].[tblLP_MFEmail]
(
[lMFEmailID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NULL,
[lAdvertiserID] [int] NULL,
[lPartnerID] [int] NULL,
[lSiteID] [int] NULL,
[lOrderNo] [int] NULL,
[sAgencyId] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sStatus] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szResetURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dtUpdate] [datetime] NOT NULL,
[sProcessed] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_MFEmail] ADD CONSTRAINT [tblLP_MFEmail_PK] PRIMARY KEY NONCLUSTERED  ([lMFEmailID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_MFEmail] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_MFEmail] TO [web_user]
GO
