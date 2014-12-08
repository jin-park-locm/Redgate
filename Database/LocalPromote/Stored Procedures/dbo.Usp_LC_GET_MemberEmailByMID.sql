SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_GET_MemberEmailByMID]     @lMemberID		int	,@sEmailType	char(1) = NULL	     AS
SET NOCOUNT ONBEGIN    SELECT             e.[lMemberEmailID]--       e.[lMemberID]--      ,a.[szStreeName]--      ,a.[szUnit]--      ,a.[szCity]--      ,a.[sState]--      ,a.[sPostalCode]--      ,a.[lCountryID]--      ,a.[sAdrTypeCode]--      ,p.[sCountryCode]--		,p.[szPhone]--      ,p.[szExt]		,e.[szEmail]--        ,e.[sEmailType]--        ,e.[sActive]--        ,e.[dtUpdate]		,e.sEmailTypeFROM  [dbo].[tblLP_MemberEmail]   e (nolock)   --JOIN  [dbo].[tblLP_MemberAddress] a		ON a.lMemberID = e.lMemberID--JOIN  [dbo].[tblLP_MemberPhone]	  p		ON p.lMemberID = e.lMemberIDWHERE	 e.lMemberID = @lMemberIDAND		 e.sActive	= 'Y'and e.sEmailType = case when @sEmailType is not NULL						then @sEmailType						else e.sEmailType						end --ORDER BY e.lMemberIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_MemberEmailByMID] TO [web_user]
GO
