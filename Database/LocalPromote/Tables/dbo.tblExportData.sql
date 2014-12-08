CREATE TABLE [dbo].[tblExportData]
(
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdvertiserID] [int] NULL,
[Category] [varchar] (265) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberID] [int] NULL,
[DateAction] [datetime] NOT NULL,
[Action] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgencyID] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BldgName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unit] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Zip] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CountyID] [int] NOT NULL,
[LocationName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Fax] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneAlt] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[URL] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HideAddress] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[tblExportData] TO [lcssui]
GRANT SELECT ON  [dbo].[tblExportData] TO [web_user]
GO
