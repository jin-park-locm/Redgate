IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'ldspg')
CREATE LOGIN [ldspg] WITH PASSWORD = 'p@ssw0rd'
GO
CREATE USER [ldspg] FOR LOGIN [ldspg]
GO
