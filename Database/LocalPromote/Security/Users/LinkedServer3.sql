IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'LinkedServer3')
CREATE LOGIN [LinkedServer3] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [LinkedServer3] FOR LOGIN [LinkedServer3]
GO
