IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\ctran')
CREATE LOGIN [ELIBERATION\ctran] FROM WINDOWS
GO
CREATE USER [ELIBERATION\ctran] FOR LOGIN [ELIBERATION\ctran]
GO
