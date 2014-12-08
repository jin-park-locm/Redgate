SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_MemberEmail]     @lMemberID  int     AS
SET NOCOUNT ONSET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTEDBEGIN    SELECT             e.[lMemberEmailID]--       e.[lMemberID]--      ,a.[szStreeName]--      ,a.[szUnit]--      ,a.[szCity]--      ,a.[sState]--      ,a.[sPostalCode]--      ,a.[lCountryID]--      ,a.[sAdrTypeCode]--      ,p.[sCountryCode]--		,p.[szPhone]--      ,p.[szExt]		,e.[szEmail]--        ,e.[sEmailType]--        ,e.[sActive]--        ,e.[dtUpdate]FROM  [dbo].[tblLP_MemberEmail]   e   --JOIN  [dbo].[tblLP_MemberAddress] a		ON a.lMemberID = e.lMemberID--JOIN  [dbo].[tblLP_MemberPhone]	  p		ON p.lMemberID = e.lMemberIDWHERE	 e.lMemberID = @lMemberIDAND		 e.sActive	= 'Y'--ORDER BY e.lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmail] TO [web_user]
GO
