IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ELIBERATION\ktipirneni')
CREATE LOGIN [ELIBERATION\ktipirneni] FROM WINDOWS
GO
CREATE USER [ELIBERATION\ktipirneni] FOR LOGIN [ELIBERATION\ktipirneni]
GO