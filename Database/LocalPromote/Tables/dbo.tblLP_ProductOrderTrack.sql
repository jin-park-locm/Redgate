CREATE TABLE [dbo].[tblLP_ProductOrderTrack]
(
[lOrderNo] [int] NOT NULL,
[lAdvertiserid] [int] NOT NULL,
[dtAdd] [datetime] NOT NULL CONSTRAINT [DF_tblLP_ProductOrderTrack_dtAdd] DEFAULT (getdate()),
[Status] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblLP_ProductOrderTrack] TO [ClientService]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderTrack] TO [lcssui]
GRANT SELECT ON  [dbo].[tblLP_ProductOrderTrack] TO [web_user]
GO
