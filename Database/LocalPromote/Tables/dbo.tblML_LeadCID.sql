CREATE TABLE [dbo].[tblML_LeadCID]
(
[CID] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCIDName] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szCIDText] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lQuantity] [int] NULL,
[dtCIDBegin] [datetime] NOT NULL,
[dtCIDEnd] [datetime] NOT NULL,
[lAgentNum] [int] NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblML_LeadCID] TO [ClientService]
GRANT INSERT ON  [dbo].[tblML_LeadCID] TO [ClientService]
GRANT DELETE ON  [dbo].[tblML_LeadCID] TO [ClientService]
GRANT UPDATE ON  [dbo].[tblML_LeadCID] TO [ClientService]
GRANT SELECT ON  [dbo].[tblML_LeadCID] TO [ELIBERATION\imarquais]
GRANT INSERT ON  [dbo].[tblML_LeadCID] TO [ELIBERATION\imarquais]
GRANT DELETE ON  [dbo].[tblML_LeadCID] TO [ELIBERATION\imarquais]
GRANT UPDATE ON  [dbo].[tblML_LeadCID] TO [ELIBERATION\imarquais]
GRANT SELECT ON  [dbo].[tblML_LeadCID] TO [lcssui]
GRANT SELECT ON  [dbo].[tblML_LeadCID] TO [web_user]
GO
