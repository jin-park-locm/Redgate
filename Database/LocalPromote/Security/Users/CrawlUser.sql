IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'CrawlUser')
CREATE LOGIN [CrawlUser] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [CrawlUser] FOR LOGIN [CrawlUser]
GO
