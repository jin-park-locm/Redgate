SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_MemberAddress]     @lMemberID		int     ASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN SELECT  --         a.[lMemberID]	   	 a.[lMemberAddressID]        ,a.[szStreeName]        ,a.[szUnit]        ,a.[szCity]        ,a.[sState]        ,a.[sPostalCode]--      ,a.[lCountryID]--      ,a.[sAdrTypeCode]--      ,p.[sCountryCode]--		,p.[szPhone]--      ,p.[szExt]--		,e.[szEmail]--      ,a.[sActive]--      ,a.[dtUpdate]FROM [dbo].[tblLP_MemberAddress]  a--JOIN [dbo].[tblLP_MemberPhone]	  p ON p.lMemberID = a.lMemberID--JOIN [dbo].[tblLP_MemberEmail]    e ON e.lMemberID = a.lMemberIDWHERE	a.lMemberID = @lMemberIDAND		a.sActive	= 'Y'--ORDER BY a.lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberAddress] TO [web_user]
GO
