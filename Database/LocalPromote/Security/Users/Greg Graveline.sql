IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\ggraveline')
CREATE LOGIN [ELIBERATION\ggraveline] FROM WINDOWS
GO
CREATE USER [Greg Graveline] FOR LOGIN [ELIBERATION\ggraveline]
GO
