SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_PartnerSite]     @lPartnerID			int    --,@lMemberID				int    ,@sSiteType				char(2)    ,@szSiteName			varchar(50)    ,@szSiteLogoPath		varchar(150)    ,@sSitePhone			char(10)    ,@szSiteEmail			varchar(100)    ,@szSSURL				varchar(100)    ,@lDistTypeid			int	,@sMyKeyword			char(1)		= 'N'    ,@sActive				char(1)		= 'Y'    ,@szUpdatedBy			varchar(20)	= 'UI'	,@dtStart				datetime = null--  ,@dtUpdate				datetime--  ,@SiteLongID			uniqueidentifier    ASSET NOCOUNT ON BEGINDECLARE @lSiteID int    INSERT INTO [dbo].[tblLP_PartnerSite]    (          [lPartnerID]        --,[lMemberID]        ,[sSiteType]        ,[szSiteName]        ,[szSiteLogoPath]        ,[sSitePhone]        ,[szSiteEmail]        ,[szSSURL]        ,[lDistTypeid]        ,[sMyKeyword]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]		,[dtStart]--      ,[SiteLongID]            )    VALUES    (         @lPartnerID        --,@lMemberID        ,@sSiteType        ,@szSiteName        ,@szSiteLogoPath        ,@sSitePhone        ,@szSiteEmail        ,@szSSURL        ,@lDistTypeid        ,@sMyKeyword        ,@sActive        ,@szUpdatedBy        ,Getdate()		,getdate()--        ,@SiteLongID            )IF @@ERROR = 0
BEGIN

	SELECT @lSiteID = SCOPE_IDENTITY()
	SELECT @lSiteID AS lSiteIDEND
END
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_PartnerSite] TO [web_user]
GO
