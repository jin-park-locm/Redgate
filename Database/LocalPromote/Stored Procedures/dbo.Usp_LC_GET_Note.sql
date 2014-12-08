SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[Usp_LC_GET_Note] --Mod by Linh
@logged_in_lMemberID int,
@lAllID		int,
@sNoteCode	char(3),
@qty		int = 3
AS
SET TRANSACTION ISOLATION LEVEL   READ UNCOMMITTED
SET NOCOUNT ON


DECLARE @security int
DECLARE @theSiteID int

SELECT @security = lSecurityLevelID  
FROM tblLP_MemberSecurity  
WHERE lMemberID = @logged_in_lMemberID 


if @security = 5 OR @security = 2
BEGIN 
	SELECT TOP (@qty)
		an.lNoteID,
		an.szNote,
		an.szUpdatedBy,
		an.dtNote,
		mi.szLoginName,
		mi.szLoginEmail
	FROM tblLP_AllNote an
	JOIN tblLP_MemberInfo mi ON an.szUpdatedBy = mi.lMemberID
	WHERE lAllID = @lAllID 
	AND sNoteCode = @sNoteCode
	ORDER BY dtNote DESC
END



IF @security = 3 
	BEGIN
	-- Find the lSiteID of partner based on lMemberID
	SELECT @theSiteID = ps.lSiteID 
	FROM tblLP_PartnerSite ps WHERE ps.lPartnerID 
	IN	(SELECT pt.lPartnerID 
		FROM tblLP_PartnerSiteMember psm 
		JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
		JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
		WHERE lMemberID = @logged_in_lMemberID
			AND pt.sActive = 'Y')
	AND ps.sSiteType='PT'
	--print @theSiteID 
	END


IF @security = 4 
	BEGIN
	-- Find the partnersite based on lMemberID
	SELECT @theSiteID = ps.lSiteID 
	FROM tblLP_PartnerSiteMember psm 
	JOIN tblLP_PartnerSite ps on ps.lSiteID = psm.lSiteID
	JOIN tblLP_Partner pt on pt.lPartnerID = ps.lPartnerID
	WHERE lMemberID = @logged_in_lMemberID
		AND ps.sActive = 'Y'
	-- end of Find partnersite
	-- print @theSiteID
	END

IF @security = 3 OR  @security = 4	
	BEGIN
	SELECT TOP (@qty)
		an.lNoteID,
		an.szNote,
		an.szUpdatedBy,
		an.dtNote,
		mi.szLoginName,
		mi.szLoginEmail
	FROM tblLP_AllNote an
	JOIN tblLP_MemberInfo mi ON an.szUpdatedBy = mi.lMemberID 
	JOIN tblLP_PartnerSiteMember psm ON psm.lMemberID = mi.lMemberID AND psm.lSiteID = @theSiteID
	WHERE lAllID = @lAllID
	AND sNoteCode = @sNoteCode
	ORDER BY dtNote DESC 
	END




GO
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_GET_Note] TO [web_user]
GO
