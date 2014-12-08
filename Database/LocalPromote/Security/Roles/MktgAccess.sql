CREATE ROLE [MktgAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'MktgAccess', N'ELIBERATION\hkuan'
GO
EXEC sp_addrolemember N'MktgAccess', N'ELIBERATION\lcrusius'
GO
EXEC sp_addrolemember N'MktgAccess', N'ELIBERATION\TCAMPBELL'
GO
