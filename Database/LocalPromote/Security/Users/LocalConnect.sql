IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'LocalConnect')
CREATE LOGIN [LocalConnect] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [LocalConnect] FOR LOGIN [LocalConnect]
GO
