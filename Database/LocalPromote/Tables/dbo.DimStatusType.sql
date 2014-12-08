CREATE TABLE [dbo].[DimStatusType]
(
[StatusKey] [int] NOT NULL IDENTITY(1, 1),
[Status] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StatusDesc] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Active] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StartDate] [datetime] NOT NULL,
[EndDate] [datetime] NOT NULL CONSTRAINT [DFDimStatusTypeEndDate] DEFAULT ('12/31/9999'),
[LoadDate] [datetime] NOT NULL CONSTRAINT [DFDimStatusTypeLoadDate] DEFAULT (getdate()),
[CurrentStatus] [bit] NOT NULL CONSTRAINT [DFDimStatusTypeCurrentStatus] DEFAULT ((1))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimStatusType] ADD CONSTRAINT [PKDimStatusType] PRIMARY KEY CLUSTERED  ([StatusKey]) WITH (FILLFACTOR=80) ON [PRIMARY]
GO
