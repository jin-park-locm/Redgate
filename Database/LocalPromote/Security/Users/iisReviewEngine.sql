IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'iisReviewEngine')
CREATE LOGIN [iisReviewEngine] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [iisReviewEngine] FOR LOGIN [iisReviewEngine]
GO
