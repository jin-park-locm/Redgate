CREATE TABLE [dbo].[YEXT]
(
[lAdvertiserID] [int] NOT NULL IDENTITY(1, 1),
[RIDAX] [int] NULL,
[sAgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sSource] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[lmemberid] [int] NOT NULL
) ON [PRIMARY]
GO
