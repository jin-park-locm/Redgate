SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_UPD_Partner]     @lPartnerID			int    ,@szPartnerName			varchar(50)		= NULL    ,@szPartnerLogoPath		varchar(150)	= NULL    ,@sContactPhone			char(10)		= NULL    ,@szPartnerEmail		varchar(100)	= NULL    ,@szSSURL				varchar(100)	= NULL    ,@szWebSite				varchar(100)	= NULL    ,@sActive				char(1)			= NULL    ,@szUpdatedBy			varchar(20)		= NULL    ,@dtUpdate				datetime		= NULL    ASSET NOCOUNT ONSELECT @sContactPhone = REPLACE(REPLACE(REPLACE(REPLACE(@sContactPhone,' ',''),'(',''),')',''),'-','')BEGIN    UPDATE [dbo].[tblLP_Partner]    SET          [szPartnerName]		= ISNULL(@szPartnerName, [szPartnerName])        ,[szPartnerLogoPath]	= ISNULL(@szPartnerLogoPath, [szPartnerLogoPath])        ,[sContactPhone]		= ISNULL(@sContactPhone, [sContactPhone])        ,[szPartnerEmail]		= ISNULL(@szPartnerEmail, [szPartnerEmail])        ,[szSSURL]				= ISNULL(@szSSURL, [szSSURL])        ,[szWebSite]			= ISNULL(@szWebSite, [szWebSite])        ,[sActive]				= ISNULL(@sActive, [sActive])        ,[szUpdatedBy]			= ISNULL(@szUpdatedBy, [szUpdatedBy])        ,[dtUpdate]				= ISNULL(@dtUpdate, Getdate())            WHERE [lPartnerID] = @lPartnerIDIF @@ERROR = 0
SELECT @lPartnerIDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_UPD_Partner] TO [web_user]
GO
