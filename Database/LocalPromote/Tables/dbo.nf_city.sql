CREATE TABLE [dbo].[nf_city]
(
[literal] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[norm] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[nf_city] ADD CONSTRAINT [pk_nf_city_literal] PRIMARY KEY CLUSTERED  ([literal]) ON [PRIMARY]
GO
