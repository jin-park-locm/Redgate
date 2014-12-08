CREATE TABLE [dbo].[loc_Counties]
(
[CountyID] [uniqueidentifier] NOT NULL,
[State] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[County] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
GRANT SELECT ON  [dbo].[loc_Counties] TO [lcssui]
GRANT SELECT ON  [dbo].[loc_Counties] TO [web_user]
GO
