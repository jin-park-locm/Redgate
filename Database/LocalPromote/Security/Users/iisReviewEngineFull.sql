IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'iisReviewEngineFull')
CREATE LOGIN [iisReviewEngineFull] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [iisReviewEngineFull] FOR LOGIN [iisReviewEngineFull]
GO
