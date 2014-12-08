IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'web_user')
CREATE LOGIN [web_user] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [web_user] FOR LOGIN [web_user]
GO
