SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[usp_LC_GET_Buslisting_bylMemberID]
@lMemberID		int 

AS
SET NOCOUNT ON
 
 
BEGIN
	SELECT	l.lMemberID,
			l.szTitle,
			l.szCity,
			l.sPostalCode

	FROM    tblLP_BusListing l
	WHERE	l.lMemberID = @lMemberID
END
GO
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_GET_Buslisting_bylMemberID] TO [web_user]
GO
