CREATE TABLE [dbo].[tblLP_BusListingProfileURL_DELs]
(
[lAdvertiserID] [int] NOT NULL,
[szProfileURL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[sLPProfile] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szNonLPProfile] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[sActive] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[szUpdatedBy] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtUpdate] [datetime] NOT NULL,
[DtDeleted] [datetime] NOT NULL CONSTRAINT [DF__tblLP_Bus__DtDel__2FDC6987] DEFAULT (getdate()),
[Machine] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__tblLP_Bus__Machi__30D08DC0] DEFAULT ((suser_sname()+'@')+host_name())
) ON [PRIMARY]
GO
