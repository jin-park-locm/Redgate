SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL]

 @lSiteID			int
,@szSiteDirectoryURL varchar(150)
,@sDefault			char(1)		= 'Y'
,@sActive			char(1)		= 'Y'
,@szUpdatedBy		varchar(20)	= 'UI' 
,@dtUpdate			datetime	= NULL

AS
SET NOCOUNT ON

-- PK lSiteID

UPDATE url
SET		szSiteDirectoryURL = @szSiteDirectoryURL,
		dtUpdate	= ISNULL (@dtUpdate, Getdate()) 
FROM  tblLP_PartnerSiteDirectoryURL url
WHERE lSiteID = @lSiteID

IF @@ERROR = 0
SELECT @lSiteID as lSiteID
GO
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_UPD_PartnerSiteDirectoryURL] TO [web_user]
GO
