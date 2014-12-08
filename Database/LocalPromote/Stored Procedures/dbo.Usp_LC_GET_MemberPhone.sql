SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_MemberPhone]     @lMemberID  intASSET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT 		 p.[lMemberPhoneID]--         p.[lMemberID]--        ,a.[szStreeName]--        ,a.[szUnit]--        ,a.[szCity]--        ,a.[sState]--        ,a.[sPostalCode]--        ,a.[lCountryID]--        ,a.[sAdrTypeCode]--        ,p.[sCountryCode]          ,p.[szPhone]          ,p.[szExt]--        ,e.[szEmail]          ,p.[sPhoneType]--        ,p.[sActive]--        ,p.[dtUpdate]    FROM [dbo].[tblLP_MemberPhone]		p--	JOIN [dbo].[tblLP_MemberEmail]		e		ON p.lMemberID = e.lMemberID--	JOIN  [dbo].[tblLP_MemberAddress]	a		ON a.lMemberID = p.lMemberID	WHERE   p.lMemberID = @lMemberID	AND p.sActive = 'Y'--	ORDER BY p.lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberPhone] TO [web_user]
GO
