IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'mlewis')
CREATE LOGIN [mlewis] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [mlewis] FOR LOGIN [mlewis]
GO
