CREATE TABLE [dbo].[tblCC_acxBDC]
(
[lCCBdcID] [int] NOT NULL IDENTITY(500000, 1),
[RID] [int] NULL,
[BDC] [int] NOT NULL,
[sAction] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sConfirm] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sUpdate] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtTurn] [datetime] NULL,
[lCCListingID] [int] NULL,
[sDBState] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCC_acxBDC] ADD CONSTRAINT [tblCC_acxBDC_PK] PRIMARY KEY CLUSTERED  ([lCCBdcID]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblCC_acxBDC] TO [iisLpAdminFull]
GRANT INSERT ON  [dbo].[tblCC_acxBDC] TO [iisLpAdminFull]
GRANT SELECT ON  [dbo].[tblCC_acxBDC] TO [iisLpAdminSsUiFull]
GRANT INSERT ON  [dbo].[tblCC_acxBDC] TO [iisLpAdminSsUiFull]
GRANT SELECT ON  [dbo].[tblCC_acxBDC] TO [iisReviewEngineFull]
GRANT INSERT ON  [dbo].[tblCC_acxBDC] TO [iisReviewEngineFull]
GRANT SELECT ON  [dbo].[tblCC_acxBDC] TO [lcssui]
GRANT SELECT ON  [dbo].[tblCC_acxBDC] TO [web_user]
GRANT INSERT ON  [dbo].[tblCC_acxBDC] TO [web_user]
GO
