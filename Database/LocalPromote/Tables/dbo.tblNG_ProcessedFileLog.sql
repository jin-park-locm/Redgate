CREATE TABLE [dbo].[tblNG_ProcessedFileLog]
(
[FileName] [varchar] (512) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[dtProcessed] [datetime] NOT NULL CONSTRAINT [DF__tblNG_Pro__dtPro__7FEE2A9A] DEFAULT (getdate())
) ON [PRIMARY]
GO
