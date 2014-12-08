CREATE TABLE [dbo].[tblLP_PasswordTicket]
(
[lPasswordTicketID] [int] NOT NULL IDENTITY(1, 1),
[lMemberID] [int] NULL,
[dTimestampCreated] [datetime] NULL,
[dTimestampModified] [datetime] NULL,
[sActive] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sHash] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sData] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblLP_PasswordTicket] ADD CONSTRAINT [PK_tblLP_PasswordTicket] PRIMARY KEY CLUSTERED  ([lPasswordTicketID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_PasswordTicket] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_PasswordTicket] TO [web_user]
GO
