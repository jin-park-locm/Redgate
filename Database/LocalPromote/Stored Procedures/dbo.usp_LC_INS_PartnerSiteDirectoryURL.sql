SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[usp_LC_INS_PartnerSiteDirectoryURL]

@lSiteID			int,
@szSiteDirectoryURL varchar(150)

AS
SET NOCOUNT ON

INSERT INTO [tblLP_PartnerSiteDirectoryURL]
           ([lSiteID]
           ,[szSiteDirectoryURL]
           ,[sDefault]
           ,[sActive]
           ,[szUpdatedBy]
           ,[dtUpdate])
     VALUES
           (@lSiteID
           ,@szSiteDirectoryURL
           ,'Y'
           ,'Y'
           ,'UI'
           ,getdate())

IF @@ERROR = 0
SELECT	@lSiteID as lSiteID, 
		@szSiteDirectoryURL as szSiteDirectoryURL
GO
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [lcssui]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[usp_LC_INS_PartnerSiteDirectoryURL] TO [web_user]
GO
