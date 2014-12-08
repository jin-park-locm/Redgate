IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'mzhang')
CREATE LOGIN [mzhang] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [mzhang] FOR LOGIN [mzhang]
GO
