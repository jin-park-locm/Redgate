IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'lcssui')
CREATE LOGIN [lcssui] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [lcssui] FOR LOGIN [lcssui]
GO
