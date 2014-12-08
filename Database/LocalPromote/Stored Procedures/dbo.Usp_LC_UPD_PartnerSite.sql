SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_PartnerSite]     @lSiteID			int    ,@lPartnerID		int				= NULL    ,@sSiteType			char(2)			= NULL    ,@szSiteName		varchar(50)		= NULL    ,@szSiteLogoPath	varchar(150)	= NULL    ,@sSitePhone		char(10)		= NULL    ,@szSiteEmail		varchar(100)	= NULL    ,@szSSURL			varchar(100)	= NULL    ,@lDistTypeid		int				= NULL    ,@sMyKeyword		char(1)			= NULL    ,@sActive			char(1)			= 'Y'    ,@szUpdatedBy		varchar(20)		= 'UI'    ,@dtUpdate			datetime		= NULL    ,@SiteLongID		uniqueidentifier= NULL    ASSET NOCOUNT ONBEGIN    UPDATE [dbo].[tblLP_PartnerSite]    SET          [lPartnerID]		= ISNULL(@lPartnerID, [lPartnerID])        ,[sSiteType]		= ISNULL(@sSiteType, [sSiteType])        ,[szSiteName]		= ISNULL(@szSiteName, [szSiteName])        ,[szSiteLogoPath]	= ISNULL(@szSiteLogoPath, [szSiteLogoPath])        ,[sSitePhone]		= ISNULL(@sSitePhone, [sSitePhone])        ,[szSiteEmail]		= ISNULL(@szSiteEmail, [szSiteEmail])        ,[szSSURL]			= ISNULL(@szSSURL, [szSSURL])        ,[lDistTypeid]		= ISNULL(@lDistTypeid, [lDistTypeid])        ,[sMyKeyword]		= ISNULL(@sMyKeyword, [sMyKeyword])        ,[sActive]			= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]		= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]			= ISNULL(@dtUpdate, Getdate())        ,[SiteLongID]		= ISNULL(@SiteLongID, [SiteLongID])            WHERE [lSiteID] = @lSiteIDIF @@ERROR = 0
SELECT @lSiteID as lSiteID
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_PartnerSite] TO [web_user]
GO
