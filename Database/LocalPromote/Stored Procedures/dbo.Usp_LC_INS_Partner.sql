SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Usp_LC_INS_Partner]     @szPartnerName		varchar(50)    ,@szPartnerLogoPath varchar(150)    ,@sContactPhone		char(10)    ,@szPartnerEmail	varchar(100)    ,@szSSURL			varchar(100)    ,@szWebSite			varchar(100)	= NULL    ,@sActive			char(1)			= 'Y'    ,@szUpdatedBy		varchar(20)		= 'UI'	,@dtStart			datetime = NULL    ASSET NOCOUNT ON BEGIN DECLARE @lPartnerID int    INSERT INTO [dbo].[tblLP_Partner]    (          [szPartnerName]        ,[szPartnerLogoPath]        ,[sContactPhone]        ,[szPartnerEmail]        ,[szSSURL]        ,[szWebSite]        ,[sActive]        ,[szUpdatedBy]        ,[dtUpdate]		,[dtStart]            )    VALUES    (         @szPartnerName        ,@szPartnerLogoPath        ,@sContactPhone        ,@szPartnerEmail        ,@szSSURL        ,@szWebSite        ,@sActive        ,@szUpdatedBy        ,Getdate()		,getdate()            )IF @@ERROR = 0
BEGIN
	SELECT @lPartnerID = SCOPE_IDENTITY()
	SELECT @lPartnerID AS lPartnerIDENDEND
GO
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [iisLpAdminFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [iisLpAdminSsUiFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [iisReviewEngine]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [iisReviewEngineFull]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [lcssui]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [LocalConnect]
GRANT EXECUTE ON  [dbo].[Usp_LC_INS_Partner] TO [web_user]
GO
