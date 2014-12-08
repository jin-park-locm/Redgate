CREATE TABLE [dbo].[tbl_apiauth]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[username] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ipaddress] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtdatetime] [smalldatetime] NOT NULL CONSTRAINT [DF_tbl_apiauth_dtdatetime] DEFAULT (getdate()),
[apikey] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[memberid] [int] NULL CONSTRAINT [DF_tbl_apiauth_memberid] DEFAULT ((0)),
[lSecurityID] [int] NULL,
[lActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_tbl_apiauth_lActive] DEFAULT ('Y')
) ON [PRIMARY]
GO
